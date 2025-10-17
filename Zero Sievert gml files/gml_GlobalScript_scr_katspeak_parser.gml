function KatspeakParser(arg0, arg1) constructor
{
    static update = function()
    {
        if (lexer.peek() == UnknownEnum.Value_63)
        {
            if (!finalised)
            {
                ir.popFunction();
                finalised = true;
            }
            
            return false;
        }
        
        if (true && finalised)
            __katspeak_error("attempting to update parser after it has been finalised");
        
        __parseStatement();
        return true;
    };
    
    static __parseStatement = function()
    {
        var peeked = lexer.peek();
        var result;
        
        if (peeked == UnknownEnum.Value_7)
        {
            lexer.next();
            exit;
        }
        else if (peeked == UnknownEnum.Value_50)
        {
            lexer.next();
            
            if (lexer.next() != UnknownEnum.Value_59)
                __ex("expected identifier after 'let' keyword");
            
            var localName = lexer.getValue();
            var location = lexer.getLocation();
            var valueTerm;
            
            if (lexer.peek() == UnknownEnum.Value_12)
            {
                lexer.next();
                valueTerm = __parseExpression();
            }
            else
            {
                valueTerm = ir.createValue(undefined, location);
            }
            
            var getter = ir.allocLocal(localName, location);
            result = ir.createAssign(UnknownEnum.Value_0, getter, valueTerm, lexer.getLocation());
        }
        else
        {
            result = __parseExpression();
        }
        
        ir.createStatement(result);
    };
    
    static __parseExpression = function()
    {
        var peeked = lexer.peek();
        
        if (peeked == UnknownEnum.Value_54)
        {
            lexer.next();
            peeked = lexer.peek();
            var value;
            
            if (peeked == UnknownEnum.Value_7 || peeked == UnknownEnum.Value_5)
                value = ir.createValue(undefined, lexer.getLocation());
            else
                value = __parseExpression();
            
            return ir.createReturn(value, lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_53)
        {
            lexer.next();
            return ir.createContinue(lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_52)
        {
            lexer.next();
            peeked = lexer.peek();
            var value;
            
            if (peeked == UnknownEnum.Value_7 || peeked == UnknownEnum.Value_5 || peeked == UnknownEnum.Value_50)
                value = ir.createValue(undefined, lexer.getLocation());
            else
                value = __parseExpression();
            
            return ir.createBreak(value, lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_42)
        {
            lexer.next();
            ir.pushBlock(true);
            __parseStatements("do");
            return ir.popBlock();
        }
        else if (peeked == UnknownEnum.Value_43)
        {
            lexer.next();
            var condition = __parseCondition();
            ir.pushBlock();
            __parseStatements("if");
            var ifTrue = ir.popBlock();
            var ifFalse;
            
            if (lexer.peek() == UnknownEnum.Value_44)
            {
                lexer.next();
                ir.pushBlock();
                
                if (lexer.peek() == UnknownEnum.Value_43)
                {
                    var elseIf = __parseExpression();
                    ir.createStatement(elseIf);
                }
                else
                {
                    __parseStatements("else");
                }
                
                ifFalse = ir.popBlock();
            }
            else
            {
                ifFalse = ir.createValue(undefined, lexer.getLocation());
            }
            
            return ir.createIf(condition, ifTrue, ifFalse, lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_45)
        {
            lexer.next();
            var condition = __parseCondition();
            ir.pushBlock();
            __parseStatements("while");
            var body = ir.popBlock();
            return ir.createWhile(condition, body, lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_48)
        {
            lexer.next();
            var scope = __parseCondition();
            ir.pushBlock();
            __parseStatements("with");
            var body = ir.popBlock();
            return ir.createWith(scope, body, lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_49)
        {
            lexer.next();
            var value = __parseExpression();
            var conditions = __parseMatchArms();
            return ir.createMatch(value, conditions, lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_51)
        {
            lexer.next();
            ir.pushFunction();
            
            if (lexer.peek() != UnknownEnum.Value_4)
            {
                if (lexer.next() != UnknownEnum.Value_0)
                    __ex("expected opening '(' after 'fun' keyword");
                
                while (__isNot(UnknownEnum.Value_1))
                {
                    if (lexer.next() != UnknownEnum.Value_59)
                        __ex("expected identifier in function arguments");
                    
                    ir.allocArg(lexer.getValue(), lexer.getLocation());
                    
                    if (lexer.peek() == UnknownEnum.Value_8)
                        lexer.next();
                }
                
                if (lexer.next() != UnknownEnum.Value_1)
                    __ex("expected closing ')' after function arguments");
            }
            
            __parseStatements("function");
            return ir.popFunction();
        }
        else
        {
            return __parseAssign();
        }
    };
    
    static __parseStatements = function(arg0)
    {
        if (lexer.next() != UnknownEnum.Value_4)
            __ex("expected opening '{' at the start of '", arg0, "' block");
        
        while (__isNot(UnknownEnum.Value_5))
            __parseStatement();
        
        if (lexer.next() != UnknownEnum.Value_5)
            __ex("expected closing '}' after '", arg0, "' block");
    };
    
    static __parseCondition = function()
    {
        return __parseAssign();
    };
    
    static __parseAssign = function()
    {
        var lhs = __parseOpLogicalOR();
        var peeked = lexer.peek();
        
        if (peeked == UnknownEnum.Value_12 || peeked == UnknownEnum.Value_13 || peeked == UnknownEnum.Value_14 || peeked == UnknownEnum.Value_15 || peeked == UnknownEnum.Value_16)
        {
            lexer.next();
            var assignType = __katspeak_operator_assign_from_token(peeked);
            lhs = ir.createAssign(assignType, lhs, __parseExpression(), lexer.getLocation());
        }
        
        return lhs;
    };
    
    static __parseOpLogicalOR = function()
    {
        var result = __parseOpLogicalAND();
        
        while (true)
        {
            var peeked = lexer.peek();
            
            if (peeked == UnknownEnum.Value_38)
            {
                lexer.next();
                var lhs = result;
                var rhs = __parseOpLogicalAND();
                result = ir.createOr(lhs, rhs, lexer.getLocation());
            }
            else if (peeked == UnknownEnum.Value_39)
            {
                lexer.next();
                var lhs = result;
                var rhs = __parseOpLogicalAND();
                result = ir.createBinary(UnknownEnum.Value_19, lhs, rhs, lexer.getLocation());
            }
            else
            {
                return result;
            }
        }
    };
    
    static __parseOpLogicalAND = function()
    {
        var result = __parseOpPipe();
        
        while (true)
        {
            var peeked = lexer.peek();
            
            if (peeked == UnknownEnum.Value_37)
            {
                lexer.next();
                var lhs = result;
                var rhs = __parseOpPipe();
                result = ir.createAnd(lhs, rhs, lexer.getLocation());
            }
            else
            {
                return result;
            }
        }
    };
    
    static __parseOpPipe = function()
    {
        var result = __parseOpEquality();
        
        while (true)
        {
            var peeked = lexer.peek();
            
            if (peeked == UnknownEnum.Value_40)
            {
                lexer.next();
                var lhs = result;
                var rhs = __parseOpEquality();
                result = ir.createCall(rhs, [lhs], lexer.getLocation());
            }
            else if (peeked == UnknownEnum.Value_41)
            {
                lexer.next();
                var lhs = result;
                var rhs = __parseOpEquality();
                result = ir.createCall(lhs, [rhs], lexer.getLocation());
            }
            else
            {
                return result;
            }
        }
    };
    
    static __parseOpEquality = function()
    {
        var result = __parseOpRelational();
        
        while (true)
        {
            var peeked = lexer.peek();
            
            if (peeked == UnknownEnum.Value_24 || peeked == UnknownEnum.Value_25)
            {
                lexer.next();
                var op = __katspeak_operator_from_token(peeked);
                var lhs = result;
                var rhs = __parseOpRelational();
                result = ir.createBinary(op, lhs, rhs, lexer.getLocation());
            }
            else
            {
                return result;
            }
        }
    };
    
    static __parseOpRelational = function()
    {
        var result = __parseOpBitwise();
        
        while (true)
        {
            var peeked = lexer.peek();
            
            if (peeked == UnknownEnum.Value_28 || peeked == UnknownEnum.Value_29 || peeked == UnknownEnum.Value_26 || peeked == UnknownEnum.Value_27)
            {
                lexer.next();
                var op = __katspeak_operator_from_token(peeked);
                var lhs = result;
                var rhs = __parseOpBitwise();
                result = ir.createBinary(op, lhs, rhs, lexer.getLocation());
            }
            else
            {
                return result;
            }
        }
    };
    
    static __parseOpBitwise = function()
    {
        var result = __parseOpAdd();
        
        while (true)
        {
            var peeked = lexer.peek();
            
            if (peeked == UnknownEnum.Value_34 || peeked == UnknownEnum.Value_35 || peeked == UnknownEnum.Value_36 || peeked == UnknownEnum.Value_33 || peeked == UnknownEnum.Value_32)
            {
                lexer.next();
                var op = __katspeak_operator_from_token(peeked);
                var lhs = result;
                var rhs = __parseOpAdd();
                result = ir.createBinary(op, lhs, rhs, lexer.getLocation());
            }
            else
            {
                return result;
            }
        }
    };
    
    static __parseOpAdd = function()
    {
        var result = __parseOpMultiply();
        
        while (true)
        {
            var peeked = lexer.peek();
            
            if (peeked == UnknownEnum.Value_23 || peeked == UnknownEnum.Value_22)
            {
                lexer.next();
                var op = __katspeak_operator_from_token(peeked);
                var lhs = result;
                var rhs = __parseOpMultiply();
                result = ir.createBinary(op, lhs, rhs, lexer.getLocation());
            }
            else
            {
                return result;
            }
        }
    };
    
    static __parseOpMultiply = function()
    {
        var result = __parseOpUnary();
        
        while (true)
        {
            var peeked = lexer.peek();
            
            if (peeked == UnknownEnum.Value_19 || peeked == UnknownEnum.Value_20 || peeked == UnknownEnum.Value_21 || peeked == UnknownEnum.Value_18)
            {
                lexer.next();
                var op = __katspeak_operator_from_token(peeked);
                var lhs = result;
                var rhs = __parseOpUnary();
                result = ir.createBinary(op, lhs, rhs, lexer.getLocation());
            }
            else
            {
                return result;
            }
        }
    };
    
    static __parseOpUnary = function()
    {
        var peeked = lexer.peek();
        
        if (peeked == UnknownEnum.Value_30 || peeked == UnknownEnum.Value_31 || peeked == UnknownEnum.Value_22 || peeked == UnknownEnum.Value_23)
        {
            lexer.next();
            var op = __katspeak_operator_from_token(peeked);
            var value = __parseIndex();
            return ir.createUnary(op, value, lexer.getLocation());
        }
        else
        {
            return __parseIndex();
        }
    };
    
    static __parseMatchArms = function()
    {
        if (lexer.next() != UnknownEnum.Value_4)
            __ex("expected opening '{' before 'match' arms");
        
        var conditions = [];
        
        while (__isNot(UnknownEnum.Value_5))
        {
            var prefix = lexer.next();
            var value;
            
            if (prefix == UnknownEnum.Value_44)
                value = undefined;
            else if (lexer.getLexeme() != "case")
                __ex("expected 'case' keyword before non-default match arm");
            else
                value = __parseExpression();
            
            ir.pushBlock();
            __parseStatements("case");
            var result = ir.popBlock();
            array_push(conditions, [value, result]);
        }
        
        if (lexer.next() != UnknownEnum.Value_5)
            __ex("expected closing '}' after 'match' arm");
        
        return conditions;
    };
    
    static __parseIndex = function()
    {
        var callNew = lexer.peek() == UnknownEnum.Value_55;
        
        if (callNew)
            lexer.next();
        
        var result = __parseTerminal();
        
        while (true)
        {
            var peeked = lexer.peek();
            
            if (peeked == UnknownEnum.Value_0)
            {
                lexer.next();
                var args = [];
                
                while (__isNot(UnknownEnum.Value_1))
                {
                    array_push(args, __parseExpression());
                    
                    if (lexer.peek() == UnknownEnum.Value_8)
                        lexer.next();
                }
                
                if (lexer.next() != UnknownEnum.Value_1)
                    __ex("expected closing ')' after function arguments");
                
                result = callNew ? ir.createCallNew(result, args, lexer.getLocation()) : ir.createCall(result, args, lexer.getLocation());
                callNew = false;
            }
            else if (peeked == UnknownEnum.Value_2)
            {
                lexer.next();
                var collection = result;
                var key = __parseExpression();
                
                if (lexer.next() != UnknownEnum.Value_3)
                    __ex("expected closing ']' after accessor expression");
                
                result = ir.createAccessor(collection, key, lexer.getLocation());
            }
            else if (peeked == UnknownEnum.Value_9)
            {
                lexer.next();
                var collection = result;
                
                if (lexer.next() != UnknownEnum.Value_59)
                    __ex("expected identifier after '.' operator");
                
                var key = ir.createValue(lexer.getValue(), lexer.getLocation());
                result = ir.createAccessor(collection, key, lexer.getLocation());
            }
            else
            {
                break;
            }
        }
        
        if (callNew)
            result = ir.createCallNew(result, [], lexer.getLocation());
        
        return result;
    };
    
    static __parseTerminal = function()
    {
        var peeked = lexer.peek();
        
        if (peeked == UnknownEnum.Value_60)
        {
            lexer.next();
            return ir.createValue(lexer.getValue(), lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_59)
        {
            lexer.next();
            return ir.createGet(lexer.getValue(), lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_57)
        {
            lexer.next();
            return ir.createSelf(lexer.getLocation());
        }
        else
        {
            return __parseGrouping();
        }
    };
    
    static __parseGrouping = function()
    {
        var peeked = lexer.peek();
        
        if (peeked == UnknownEnum.Value_0)
        {
            lexer.next();
            var inner = __parseExpression();
            
            if (lexer.next() != UnknownEnum.Value_1)
                __ex("expected closing ')' after group expression");
            
            return inner;
        }
        else if (peeked == UnknownEnum.Value_2)
        {
            lexer.next();
            var values = [];
            
            while (__isNot(UnknownEnum.Value_3))
            {
                array_push(values, __parseExpression());
                
                if (lexer.peek() == UnknownEnum.Value_8)
                    lexer.next();
            }
            
            if (lexer.next() != UnknownEnum.Value_3)
                __ex("expected closing ']' after array literal");
            
            return ir.createArray(values, lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_4)
        {
            lexer.next();
            var values = [];
            
            while (__isNot(UnknownEnum.Value_5))
            {
                var keyToken = lexer.next();
                var key;
                
                if (keyToken == UnknownEnum.Value_2)
                {
                    key = __parseExpression();
                    
                    if (lexer.next() != UnknownEnum.Value_3)
                        __ex("expected closing ']' after computed struct key");
                }
                else if (keyToken == UnknownEnum.Value_59 || keyToken == UnknownEnum.Value_60)
                {
                    key = ir.createValue(lexer.getValue(), lexer.getLocation());
                }
                else
                {
                    __ex("expected identifier or value as struct key");
                }
                
                var value;
                
                if (lexer.peek() == UnknownEnum.Value_6)
                {
                    lexer.next();
                    value = __parseExpression();
                }
                else if (keyToken == UnknownEnum.Value_59)
                {
                    value = ir.createGet(key.value, lexer.getLocation());
                }
                else
                {
                    __ex("expected ':' between key and value ", "of struct literal");
                }
                
                if (lexer.peek() == UnknownEnum.Value_8)
                    lexer.next();
                
                array_push(values, key, value);
            }
            
            if (lexer.next() != UnknownEnum.Value_5)
                __ex("expected closing '}' after struct literal");
            
            return ir.createStruct(values, lexer.getLocation());
        }
        else
        {
            __ex("malformed expression, expected: '(', '[' or '{'");
        }
    };
    
    static __ex = function()
    {
        var dbg = __katspeak_location_show(lexer.getLocation()) + " when parsing";
        
        if (argument_count < 1)
        {
            __katspeak_error(dbg);
        }
        else
        {
            var msg = "";
            
            for (var i = 0; i < argument_count; i += 1)
                msg += __katspeak_string(argument[i]);
            
            __katspeak_error(dbg, " -- ", msg, ", got ", __tokenDebug());
        }
    };
    
    static __tokenDebug = function()
    {
        var peeked = lexer.peek();
        
        if (peeked == UnknownEnum.Value_63)
            return "end of file";
        else if (peeked == UnknownEnum.Value_7)
            return "line break ';'";
        
        return "token '" + lexer.getLexeme() + "' (" + string(peeked) + ")";
    };
    
    static __isNot = function(arg0)
    {
        var peeked = lexer.peek();
        return peeked != arg0 && peeked != UnknownEnum.Value_63;
    };
    
    static __is = function(arg0)
    {
        var peeked = lexer.peek();
        return peeked == arg0 && peeked != UnknownEnum.Value_63;
    };
    
    __katspeak_check_arg_struct_instanceof("lexer", arg0, "KatspeakLexer");
    __katspeak_check_arg_struct_instanceof("builder", arg1, "KatspeakIRBuilder");
    self.lexer = arg0;
    self.ir = arg1;
    self.finalised = false;
    arg1.pushFunction();
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
    Value_48 = 48,
    Value_49,
    Value_50,
    Value_51,
    Value_52,
    Value_53,
    Value_54,
    Value_55,
    Value_57 = 57,
    Value_59 = 59,
    Value_60,
    Value_63 = 63
}
