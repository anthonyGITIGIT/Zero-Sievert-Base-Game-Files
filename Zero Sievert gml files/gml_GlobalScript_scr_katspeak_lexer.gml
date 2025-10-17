function __katspeak_is_token(arg0)
{
    return is_numeric(arg0) && (arg0 >= 0 && arg0 < UnknownEnum.Value_66);
}

function __katspeak_create_buffer_from_string(arg0)
{
    var capacity = string_byte_length(arg0);
    var buff = buffer_create(capacity, buffer_fixed, 1);
    buffer_write(buff, buffer_text, arg0);
    buffer_seek(buff, buffer_seek_start, 0);
    return buff;
}

function KatspeakLexer(arg0, arg1 = 0, arg2 = infinity, arg3 = undefined) constructor
{
    static __nextUTF8Char = function()
    {
        if (buffOffset >= buffSize)
            return 0;
        
        var byte = buffer_peek(buff, buffOffset, buffer_u8);
        buffOffset += 1;
        
        if ((byte & 128) == 0)
            return byte;
        
        var headerMask, codepointCount;
        
        if ((byte & 252) == 252)
        {
            codepointCount = 5;
            headerMask = 252;
        }
        else if ((byte & 248) == 248)
        {
            codepointCount = 4;
            headerMask = 248;
        }
        else if ((byte & 240) == 240)
        {
            codepointCount = 3;
            headerMask = 240;
        }
        else if ((byte & 224) == 224)
        {
            codepointCount = 2;
            headerMask = 224;
        }
        else if ((byte & 192) == 192)
        {
            codepointCount = 1;
            headerMask = 192;
        }
        else
        {
            return -1;
        }
        
        var dataWidth = 6;
        var utf8Value = (byte & ~headerMask) << (codepointCount * dataWidth);
        var i = codepointCount - 1;
        
        while (i >= 0)
        {
            byte = buffer_peek(buff, buffOffset, buffer_u8);
            buffOffset += 1;
            
            if ((byte & 128) == 0)
                return -1;
            
            utf8Value |= ((byte & -193) << (i * dataWidth));
            i -= 1;
        }
        
        return utf8Value;
    };
    
    static __advance = function()
    {
        lexemeEnd = buffOffset;
        
        if (charNext == 13)
        {
            column = 1;
            row += 1;
        }
        else if (charNext == 10)
        {
            column = 1;
            
            if (charCurr != 13)
                row += 1;
        }
        else
        {
            column += 1;
        }
        
        charCurr = charNext;
        charNext = __nextUTF8Char();
    };
    
    static __clearLexeme = function()
    {
        lexemeStart = lexemeEnd;
        lexemePos = katspeak_location_create(self.row, self.column);
        lexeme = undefined;
        hasValue = false;
    };
    
    static __slice = function(arg0, arg1)
    {
        var buff_ = buff;
        var clipStart = min(arg0, buffSize);
        var clipEnd = min(arg1, buffSize);
        
        if (clipEnd <= clipStart)
        {
            if (true && clipEnd < clipStart)
                __katspeak_error_bug();
            
            return "";
        }
        else if (clipEnd >= buffCapacity)
        {
            return buffer_peek(buff_, clipStart, buffer_text);
        }
        else
        {
            var byte = buffer_peek(buff_, clipEnd, buffer_u8);
            buffer_poke(buff_, clipEnd, buffer_u8, 0);
            var result = buffer_peek(buff_, clipStart, buffer_string);
            buffer_poke(buff_, clipEnd, buffer_u8, byte);
            return result;
        }
    };
    
    static getLexeme = function()
    {
        lexeme ??= __slice(lexemeStart, lexemeEnd);
        return lexeme;
    };
    
    static __getKeyword = function(arg0)
    {
        var keyword = variable_struct_get(keywords, arg0);
        
        if (true && keyword != undefined)
            __katspeak_check_arg("keyword", keyword, __katspeak_is_token, "KatspeakToken");
        
        return keyword;
    };
    
    static getValue = function()
    {
        if (hasValue)
            return value;
        
        value = getLexeme();
        hasValue = true;
        return value;
    };
    
    static getLocation = function()
    {
        return katspeak_location_create(row, column);
    };
    
    static nextWithWhitespace = function()
    {
        __clearLexeme();
        
        if (charNext == 0)
            return UnknownEnum.Value_63;
        
        __advance();
        var token = UnknownEnum.Value_64;
        var charCurr_ = charCurr;
        
        if (charCurr_ >= 0 && charCurr_ < 256)
            token = global.__katspeakChar2Token[charCurr_];
        
        if (charCurr_ == 34 || (charCurr_ == 64 && charNext == 34))
        {
            var isRaw = charCurr_ == 64;
            
            if (isRaw)
            {
                token = UnknownEnum.Value_60;
                __advance();
            }
            
            var skipNextChar = false;
            var processEscapes = false;
            
            while (true)
            {
                var charNext_ = charNext;
                
                if (charNext_ == 0)
                    break;
                
                if (skipNextChar)
                {
                    __advance();
                    skipNextChar = false;
                    continue;
                }
                
                if (!isRaw && charNext == 92)
                {
                    skipNextChar = true;
                    processEscapes = true;
                }
                else if (charNext_ == 34)
                {
                    break;
                }
                
                __advance();
            }
            
            var value_ = __slice(lexemeStart + (isRaw ? 2 : 1), lexemeEnd);
            
            if (charNext == 34)
                __advance();
            
            if (processEscapes)
            {
                value_ = string_replace_all(value_, "\\\"", "\"");
                value_ = string_replace_all(value_, "\\t", "\t");
                value_ = string_replace_all(value_, "\\n", "\n");
                value_ = string_replace_all(value_, "\\v", "\v");
                value_ = string_replace_all(value_, "\\f", "\f");
                value_ = string_replace_all(value_, "\\r", "\r");
                value_ = string_replace_all(value_, "\\\\", "\\");
            }
            
            value = value_;
            hasValue = true;
        }
        else if (__katspeak_char_is_operator(charCurr_))
        {
            switch (charCurr)
            {
                case 59:
                    token = UnknownEnum.Value_7;
                    break;
                
                case 58:
                    token = UnknownEnum.Value_6;
                    break;
                
                case 44:
                    token = UnknownEnum.Value_8;
                    break;
                
                case 46:
                    token = UnknownEnum.Value_9;
                    break;
                
                case 61:
                    if (charNext == 61)
                    {
                        __advance();
                        token = UnknownEnum.Value_24;
                    }
                    else
                    {
                        token = UnknownEnum.Value_12;
                    }
                    
                    break;
                
                case 42:
                    if (charNext == 61)
                    {
                        __advance();
                        token = UnknownEnum.Value_13;
                    }
                    else
                    {
                        token = UnknownEnum.Value_19;
                    }
                    
                    break;
                
                case 47:
                    if (charNext == 61)
                    {
                        __advance();
                        token = UnknownEnum.Value_14;
                    }
                    else if (charNext == 47)
                    {
                        __advance();
                        token = UnknownEnum.Value_21;
                    }
                    else
                    {
                        token = UnknownEnum.Value_20;
                    }
                    
                    break;
                
                case 37:
                    token = UnknownEnum.Value_18;
                    break;
                
                case 43:
                    if (charNext == 61)
                    {
                        __advance();
                        token = UnknownEnum.Value_16;
                    }
                    else
                    {
                        token = UnknownEnum.Value_23;
                    }
                    
                    break;
                
                case 45:
                    if (charNext == 61)
                    {
                        __advance();
                        token = UnknownEnum.Value_15;
                    }
                    else if (charNext == 45)
                    {
                        __advance();
                        token = UnknownEnum.Value_62;
                    }
                    else
                    {
                        token = UnknownEnum.Value_22;
                    }
                    
                    break;
                
                case 33:
                    if (charNext == 61)
                    {
                        __advance();
                        token = UnknownEnum.Value_25;
                    }
                    else
                    {
                        token = UnknownEnum.Value_30;
                    }
                    
                    break;
                
                case 62:
                    if (charNext == 61)
                    {
                        __advance();
                        token = UnknownEnum.Value_27;
                    }
                    else if (charNext == 62)
                    {
                        __advance();
                        token = UnknownEnum.Value_32;
                    }
                    else
                    {
                        token = UnknownEnum.Value_26;
                    }
                    
                    break;
                
                case 60:
                    if (charNext == 61)
                    {
                        __advance();
                        token = UnknownEnum.Value_29;
                    }
                    else if (charNext == 124)
                    {
                        __advance();
                        token = UnknownEnum.Value_41;
                    }
                    else if (charNext == 60)
                    {
                        __advance();
                        token = UnknownEnum.Value_33;
                    }
                    else
                    {
                        token = UnknownEnum.Value_28;
                    }
                    
                    break;
                
                case 126:
                    token = UnknownEnum.Value_31;
                    break;
                
                case 38:
                    token = UnknownEnum.Value_34;
                    break;
                
                case 94:
                    token = UnknownEnum.Value_35;
                    break;
                
                case 124:
                    if (charNext == 62)
                    {
                        __advance();
                        token = UnknownEnum.Value_40;
                    }
                    else
                    {
                        token = UnknownEnum.Value_36;
                    }
                    
                    break;
            }
            
            if (token == UnknownEnum.Value_62)
            {
                lexeme = undefined;
                
                while (true)
                {
                    var charNext_ = charNext;
                    
                    if (charNext_ == 10 || charNext_ == 13 || charNext_ == 0)
                        break;
                    
                    __advance();
                }
            }
        }
        else if (charCurr_ == 96)
        {
            while (true)
            {
                var charNext_ = charNext;
                
                if (charNext_ == 96 || charNext_ == 0 || __katspeak_char_is_whitespace(charNext_))
                    break;
                
                __advance();
            }
            
            value = __slice(lexemeStart + 1, lexemeEnd);
            hasValue = true;
            
            if (charNext == 96)
                __advance();
        }
        else if (token == UnknownEnum.Value_59)
        {
            while (__katspeak_char_is_alphanumeric(charNext))
                __advance();
            
            var lexeme_ = getLexeme();
            var keyword = __getKeyword(lexeme_);
            
            if (keyword != undefined)
            {
                token = keyword;
            }
            else if (lexeme_ == "true")
            {
                token = UnknownEnum.Value_60;
                value = true;
                hasValue = true;
            }
            else if (lexeme_ == "false")
            {
                token = UnknownEnum.Value_60;
                value = false;
                hasValue = true;
            }
            else if (lexeme_ == "undefined")
            {
                token = UnknownEnum.Value_60;
                value = undefined;
                hasValue = true;
            }
            else if (lexeme_ == "NaN")
            {
                token = UnknownEnum.Value_60;
                value = NaN;
                hasValue = true;
            }
            else if (lexeme_ == "infinity")
            {
                token = UnknownEnum.Value_60;
                value = infinity;
                hasValue = true;
            }
        }
        else if (charCurr_ == 39)
        {
            __advance();
            value = charCurr;
            hasValue = true;
            
            if (charNext == 39)
                __advance();
        }
        else if (charCurr_ == 48 && (charNext == 120 || charNext == 88))
        {
            __advance();
            var digitStack = ds_stack_create();
            
            while (true)
            {
                var charNext_ = charNext;
                
                if (__katspeak_char_is_digit_hex(charNext_))
                {
                    ds_stack_push(digitStack, __katspeak_char_hex_to_dec(charNext_));
                    __advance();
                }
                else if (charNext_ == 95)
                {
                    __advance();
                }
                else
                {
                    break;
                }
            }
            
            value = 0;
            
            for (var pow = 0; !ds_stack_empty(digitStack); pow += 1)
                value += (power(16, pow) * ds_stack_pop(digitStack));
            
            ds_stack_destroy(digitStack);
            hasValue = true;
        }
        else if (charCurr_ == 48 && (charNext == 98 || charNext == 66))
        {
            __advance();
            var digitStack = ds_stack_create();
            
            while (true)
            {
                var charNext_ = charNext;
                
                if (__katspeak_char_is_digit_binary(charNext_))
                {
                    ds_stack_push(digitStack, __katspeak_char_binary_to_dec(charNext_));
                    __advance();
                }
                else if (charNext_ == 95)
                {
                    __advance();
                }
                else
                {
                    break;
                }
            }
            
            value = 0;
            
            for (var pow = 0; !ds_stack_empty(digitStack); pow += 1)
                value += (power(2, pow) * ds_stack_pop(digitStack));
            
            ds_stack_destroy(digitStack);
            hasValue = true;
        }
        else if (charCurr_ == 35)
        {
            token = UnknownEnum.Value_60;
            var digitStack = ds_stack_create();
            
            while (true)
            {
                var charNext_ = charNext;
                
                if (__katspeak_char_is_digit_hex(charNext_))
                {
                    ds_stack_push(digitStack, __katspeak_char_hex_to_dec(charNext_));
                    __advance();
                }
                else if (charNext_ == 95)
                {
                    __advance();
                }
                else
                {
                    break;
                }
            }
            
            var digitCount = ds_stack_size(digitStack);
            var cR = 0;
            var cG = 0;
            var cB = 0;
            var cA = 0;
            
            if (digitCount == 3)
            {
                cB = ds_stack_pop(digitStack);
                cB = cB | (cB << 4);
                cG = ds_stack_pop(digitStack);
                cG = cG | (cG << 4);
                cR = ds_stack_pop(digitStack);
                cR = cR | (cR << 4);
            }
            else if (digitCount == 4)
            {
                cA = ds_stack_pop(digitStack);
                cA = cA | (cA << 4);
                cB = ds_stack_pop(digitStack);
                cB = cB | (cB << 4);
                cG = ds_stack_pop(digitStack);
                cG = cG | (cG << 4);
                cR = ds_stack_pop(digitStack);
                cR = cR | (cR << 4);
            }
            else if (digitCount == 6)
            {
                cB = ds_stack_pop(digitStack);
                cB = cB | (ds_stack_pop(digitStack) << 4);
                cG = ds_stack_pop(digitStack);
                cG = cG | (ds_stack_pop(digitStack) << 4);
                cR = ds_stack_pop(digitStack);
                cR = cR | (ds_stack_pop(digitStack) << 4);
            }
            else if (digitCount == 8)
            {
                cA = ds_stack_pop(digitStack);
                cA = cA | (ds_stack_pop(digitStack) << 4);
                cB = ds_stack_pop(digitStack);
                cB = cB | (ds_stack_pop(digitStack) << 4);
                cG = ds_stack_pop(digitStack);
                cG = cG | (ds_stack_pop(digitStack) << 4);
                cR = ds_stack_pop(digitStack);
                cR = cR | (ds_stack_pop(digitStack) << 4);
            }
            else
            {
                token = UnknownEnum.Value_64;
            }
            
            ds_stack_destroy(digitStack);
            value = cR | (cG << 8) | (cB << 16) | (cA << 24);
            hasValue = true;
        }
        else if (token == UnknownEnum.Value_60)
        {
            var hasUnderscores = false;
            var hasDecimal = false;
            
            while (true)
            {
                var charNext_ = charNext;
                
                if (__katspeak_char_is_digit(charNext_))
                {
                    __advance();
                }
                else if (charNext_ == 95)
                {
                    __advance();
                    hasUnderscores = true;
                }
                else if (!hasDecimal && charNext_ == 46)
                {
                    __advance();
                    hasDecimal = true;
                }
                else
                {
                    break;
                }
            }
            
            var digits = getLexeme();
            
            if (hasUnderscores)
                digits = string_replace_all(digits, "_", "");
            
            value = real(digits);
            hasValue = true;
        }
        
        return token;
    };
    
    static next = function()
    {
        if (peeked != undefined)
        {
            var token = peeked;
            peeked = undefined;
            return token;
        }
        
        while (true)
        {
            var token = nextWithWhitespace();
            
            if (token == UnknownEnum.Value_61 || token == UnknownEnum.Value_62)
                continue;
            
            return token;
        }
    };
    
    static peek = function()
    {
        peeked ??= next();
        return peeked;
    };
    
    __katspeak_check_init();
    __katspeak_check_arg("buff", arg0, buffer_exists);
    __katspeak_check_arg("offset", arg1, is_numeric);
    __katspeak_check_arg("size", arg2, is_numeric);
    
    if (arg3 != undefined)
        __katspeak_check_arg("keywords", arg3, is_struct);
    
    self.buff = arg0;
    self.buffAlignment = buffer_get_alignment(arg0);
    self.buffCapacity = buffer_get_size(arg0);
    self.buffOffset = clamp(arg1, 0, self.buffCapacity);
    self.buffSize = clamp(arg1 + arg2, 0, self.buffCapacity);
    self.row = 1;
    self.column = 1;
    self.lexemeStart = self.buffOffset;
    self.lexemeEnd = self.lexemeStart;
    self.lexemePos = katspeak_location_create(self.row, self.column);
    self.lexeme = undefined;
    self.value = undefined;
    self.hasValue = false;
    self.peeked = undefined;
    self.charCurr = 0;
    self.charNext = __nextUTF8Char();
    self.keywords = arg3 ?? global.__katspeakString2Token;
}

function __katspeak_init_lexer()
{
    global.__katspeakChar2Token = __katspeak_init_lexer_codepage();
    global.__katspeakString2Token = __katspeak_init_lexer_keywords();
}

function __katspeak_char_is_digit(arg0)
{
    return arg0 >= 48 && arg0 <= 57;
}

function __katspeak_char_is_digit_binary(arg0)
{
    return arg0 == 48 || arg0 == 49;
}

function __katspeak_char_binary_to_dec(arg0)
{
    return (arg0 == 48) ? 0 : 1;
}

function __katspeak_char_is_digit_hex(arg0)
{
    return (arg0 >= 97 && arg0 <= 102) || (arg0 >= 65 && arg0 <= 70) || (arg0 >= 48 && arg0 <= 57);
}

function __katspeak_char_hex_to_dec(arg0)
{
    if (arg0 >= 48 && arg0 <= 57)
        return arg0 - 48;
    
    if (arg0 >= 97 && arg0 <= 102)
        return (arg0 - 97) + 10;
    
    return (arg0 - 65) + 10;
}

function __katspeak_char_is_alphanumeric(arg0)
{
    return (arg0 >= 97 && arg0 <= 122) || (arg0 >= 65 && arg0 <= 90) || (arg0 >= 48 && arg0 <= 57) || arg0 == 95;
}

function __katspeak_char_is_operator(arg0)
{
    return (arg0 >= 33 && arg0 <= 38 && arg0 != 34 && arg0 != 35) || (arg0 >= 42 && arg0 <= 47 && arg0 != 44) || (arg0 >= 58 && arg0 <= 64) || arg0 == 92 || arg0 == 94 || arg0 == 124 || arg0 == 126;
}

function __katspeak_char_is_whitespace(arg0)
{
    return (arg0 >= 9 && arg0 <= 13) || arg0 == 32 || arg0 == 133;
}

function __katspeak_codepage_value(arg0)
{
    return is_string(arg0) ? ord(arg0) : arg0;
}

function __katspeak_codepage_range(arg0, arg1, arg2)
{
    var codeVal = __katspeak_codepage_value(arg0);
    var minVal = __katspeak_codepage_value(arg1);
    var maxVal = __katspeak_codepage_value(arg2);
    return codeVal >= minVal && codeVal <= maxVal;
}

function __katspeak_codepage_set(arg0)
{
    var codeVal = __katspeak_codepage_value(arg0);
    
    for (var i = 1; i < argument_count; i += 1)
    {
        if (codeVal == __katspeak_codepage_value(argument[i]))
            return true;
    }
    
    return false;
}

function __katspeak_init_lexer_codepage()
{
    var page = array_create(256, UnknownEnum.Value_64);
    
    for (var code = 0; code < 256; code += 1)
    {
        var tokenType;
        
        if (__katspeak_codepage_set(code, 9, 10, 11, 12, 13, 32, 133))
            tokenType = UnknownEnum.Value_61;
        else if (__katspeak_codepage_range(code, "a", "z") || __katspeak_codepage_range(code, "A", "Z") || __katspeak_codepage_set(code, "_", "`"))
            tokenType = UnknownEnum.Value_59;
        else if (__katspeak_codepage_range(code, "0", "9") || __katspeak_codepage_set(code, "'"))
            tokenType = UnknownEnum.Value_60;
        else if (__katspeak_codepage_set(code, "\""))
            tokenType = UnknownEnum.Value_60;
        else if (__katspeak_codepage_set(code, "("))
            tokenType = UnknownEnum.Value_0;
        else if (__katspeak_codepage_set(code, ")"))
            tokenType = UnknownEnum.Value_1;
        else if (__katspeak_codepage_set(code, "["))
            tokenType = UnknownEnum.Value_2;
        else if (__katspeak_codepage_set(code, "]"))
            tokenType = UnknownEnum.Value_3;
        else if (__katspeak_codepage_set(code, "{"))
            tokenType = UnknownEnum.Value_4;
        else if (__katspeak_codepage_set(code, "}"))
            tokenType = UnknownEnum.Value_5;
        else if (__katspeak_codepage_set(code, ","))
            tokenType = UnknownEnum.Value_8;
        else
            continue;
        
        page[code] = tokenType;
    }
    
    return page;
}

function __katspeak_keywords_create()
{
    var keywords = {};
    keywords.and = UnknownEnum.Value_37;
    keywords.or = UnknownEnum.Value_38;
    keywords.xor = UnknownEnum.Value_39;
    keywords.do = UnknownEnum.Value_42;
    keywords.if = UnknownEnum.Value_43;
    keywords.else = UnknownEnum.Value_44;
    keywords.while = UnknownEnum.Value_45;
    keywords.for = UnknownEnum.Value_46;
    keywords.loop = UnknownEnum.Value_47;
    keywords.with = UnknownEnum.Value_48;
    keywords.match = UnknownEnum.Value_49;
    keywords.let = UnknownEnum.Value_50;
    keywords.function = UnknownEnum.Value_51;
    keywords.params = UnknownEnum.Value_58;
    keywords.break = UnknownEnum.Value_52;
    keywords.continue = UnknownEnum.Value_53;
    keywords.return = UnknownEnum.Value_54;
    keywords.new = UnknownEnum.Value_55;
    keywords.impl = UnknownEnum.Value_56;
    keywords.self = UnknownEnum.Value_57;
    keywords.func = UnknownEnum.Value_51;
    return keywords;
}

function __katspeak_keywords_rename(arg0, arg1, arg2)
{
    if (!variable_struct_exists(arg0, arg1))
    {
        __katspeak_error_silent("no keyword with the name '", arg1, "' exists");
        exit;
    }
    
    var token = variable_struct_get(arg0, arg1);
    variable_struct_remove(arg0, arg1);
    variable_struct_set(arg0, arg2, token);
}

function __katspeak_keywords_find_name(arg0, arg1)
{
    __katspeak_check_arg("keywords", arg0, is_struct);
    __katspeak_check_arg("token", arg1, __katspeak_is_token, "KatspeakToken");
    var variables = variable_struct_get_names(arg0);
    var variableCount = array_length(variables);
    
    for (var i = 0; i < variableCount; i += 1)
    {
        var variable = variables[i];
        
        if (variable_struct_get(arg0, variable) == arg1)
            return variable;
    }
    
    return undefined;
}

function __katspeak_init_lexer_keywords()
{
    var keywords = __katspeak_keywords_create();
    global.__katspeakConfig.keywords = keywords;
    return keywords;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_12 = 12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_18 = 18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_47,
    Value_48,
    Value_49,
    Value_50,
    Value_51,
    Value_52,
    Value_53,
    Value_54,
    Value_55,
    Value_56,
    Value_57,
    Value_58,
    Value_59,
    Value_60,
    Value_61,
    Value_62,
    Value_63,
    Value_64,
    Value_66 = 66
}
