function CatspeakParser(arg0, arg1) constructor
{
    static update = function()
    {
        if (lexer.peek() == UnknownEnum.Value_60)
        {
            if (!finalised)
            {
                asg.popFunction();
                finalised = true;
            }
            
            return false;
        }
        
        if (false && finalised)
            __catspeak_error("attempting to update parser after it has been finalised");
        
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
        else if (peeked == UnknownEnum.Value_47)
        {
            lexer.next();
            
            if (lexer.next() != UnknownEnum.Value_56)
                __ex("expected identifier after 'let' keyword");
            
            var localName = lexer.getValue();
            var location = lexer.getLocation();
            var valueTerm;
            
            if (lexer.peek() == UnknownEnum.Value_11)
            {
                lexer.next();
                valueTerm = __parseExpression();
            }
            else
            {
                valueTerm = asg.createValue(undefined, location);
            }
            
            var getter = asg.allocLocal(localName, location);
            result = asg.createAssign(UnknownEnum.Value_0, getter, valueTerm, lexer.getLocation());
        }
        else
        {
            result = __parseExpression();
        }
        
        asg.createStatement(result);
    };
    
    static __parseExpression = function()
    {
        var peeked = lexer.peek();
        
        if (peeked == UnknownEnum.Value_51)
        {
            lexer.next();
            peeked = lexer.peek();
            var value;
            
            if (peeked == UnknownEnum.Value_7 || peeked == UnknownEnum.Value_5)
                value = asg.createValue(undefined, lexer.getLocation());
            else
                value = __parseExpression();
            
            return asg.createReturn(value, lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_50)
        {
            lexer.next();
            return asg.createContinue(lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_49)
        {
            lexer.next();
            peeked = lexer.peek();
            var value;
            
            if (peeked == UnknownEnum.Value_7 || peeked == UnknownEnum.Value_5)
                value = asg.createValue(undefined, lexer.getLocation());
            else
                value = __parseExpression();
            
            return asg.createBreak(value, lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_40)
        {
            lexer.next();
            asg.pushBlock(true);
            __parseStatements("do");
            return asg.popBlock();
        }
        else if (peeked == UnknownEnum.Value_41)
        {
            lexer.next();
            var condition = __parseCondition();
            asg.pushBlock();
            __parseStatements("if");
            var ifTrue = asg.popBlock();
            var ifFalse;
            
            if (lexer.peek() == UnknownEnum.Value_42)
            {
                lexer.next();
                asg.pushBlock();
                
                if (lexer.peek() == UnknownEnum.Value_41)
                    __parseExpression();
                else
                    __parseStatements("else");
                
                ifFalse = asg.popBlock();
            }
            else
            {
                ifFalse = asg.createValue(undefined, lexer.getLocation());
            }
            
            return asg.createIf(condition, ifTrue, ifFalse, lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_43)
        {
            lexer.next();
            var condition = __parseCondition();
            asg.pushBlock();
            __parseStatements("while");
            var body = asg.popBlock();
            return asg.createWhile(condition, body, lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_46)
        {
            lexer.next();
            var condition = __parseCondition();
            asg.pushBlock();
            __parseStatements("use");
            var body = asg.popBlock();
            return asg.createUse(condition, body, lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_48)
        {
            lexer.next();
            asg.pushFunction();
            
            if (lexer.peek() != UnknownEnum.Value_4)
            {
                if (lexer.next() != UnknownEnum.Value_0)
                    __ex("expected opening '(' after 'fun' keyword");
                
                while (__isNot(UnknownEnum.Value_1))
                {
                    if (lexer.next() != UnknownEnum.Value_56)
                        __ex("expected identifier in function arguments");
                    
                    asg.allocArg(lexer.getValue(), lexer.getLocation());
                    
                    if (lexer.peek() == UnknownEnum.Value_8)
                        lexer.next();
                }
                
                if (lexer.next() != UnknownEnum.Value_1)
                    __ex("expected closing ')' after function arguments");
            }
            
            __parseStatements("function");
            return asg.popFunction();
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
        var lhs = __parseOpLogical();
        var peeked = lexer.peek();
        
        if (peeked == UnknownEnum.Value_11 || peeked == UnknownEnum.Value_12 || peeked == UnknownEnum.Value_13 || peeked == UnknownEnum.Value_14 || peeked == UnknownEnum.Value_15)
        {
            lexer.next();
            var assignType = __catspeak_operator_assign_from_token(peeked);
            lhs = asg.createAssign(assignType, lhs, __parseExpression(), lexer.getLocation());
        }
        
        return lhs;
    };
    
    static __parseOpLogical = function()
    {
        var result = __parseOpPipe();
        
        while (true)
        {
            var peeked = lexer.peek();
            
            if (peeked == UnknownEnum.Value_36)
            {
                lexer.next();
                var lhs = result;
                var rhs = __parseOpPipe();
                result = asg.createAnd(lhs, rhs, lexer.getLocation());
            }
            else if (peeked == UnknownEnum.Value_37)
            {
                lexer.next();
                var lhs = result;
                var rhs = __parseOpPipe();
                result = asg.createOr(lhs, rhs, lexer.getLocation());
            }
            else
            {
                return result;
            }
        }
    };
    
    static __parseOpPipe = function()
    {
        var result = __parseOpBitwise();
        
        while (true)
        {
            var peeked = lexer.peek();
            
            if (peeked == UnknownEnum.Value_38)
            {
                lexer.next();
                var lhs = result;
                var rhs = __parseOpBitwise();
                result = asg.createCall(rhs, [lhs], lexer.getLocation());
            }
            else if (peeked == UnknownEnum.Value_39)
            {
                lexer.next();
                var lhs = result;
                var rhs = __parseOpBitwise();
                result = asg.createCall(lhs, [rhs], lexer.getLocation());
            }
            else
            {
                return result;
            }
        }
    };
    
    static __parseOpBitwise = function()
    {
        var result = __parseOpBitwiseShift();
        
        while (true)
        {
            var peeked = lexer.peek();
            
            if (peeked == UnknownEnum.Value_33 || peeked == UnknownEnum.Value_34 || peeked == UnknownEnum.Value_35)
            {
                lexer.next();
                var op = __catspeak_operator_from_token(peeked);
                var lhs = result;
                var rhs = __parseOpBitwiseShift();
                result = asg.createBinary(op, lhs, rhs, lexer.getLocation());
            }
            else
            {
                return result;
            }
        }
    };
    
    static __parseOpBitwiseShift = function()
    {
        var result = __parseOpEquality();
        
        while (true)
        {
            var peeked = lexer.peek();
            
            if (peeked == UnknownEnum.Value_32 || peeked == UnknownEnum.Value_31)
            {
                lexer.next();
                var op = __catspeak_operator_from_token(peeked);
                var lhs = result;
                var rhs = __parseOpEquality();
                result = asg.createBinary(op, lhs, rhs, lexer.getLocation());
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
            
            if (peeked == UnknownEnum.Value_23 || peeked == UnknownEnum.Value_24)
            {
                lexer.next();
                var op = __catspeak_operator_from_token(peeked);
                var lhs = result;
                var rhs = __parseOpRelational();
                result = asg.createBinary(op, lhs, rhs, lexer.getLocation());
            }
            else
            {
                return result;
            }
        }
    };
    
    static __parseOpRelational = function()
    {
        var result = __parseOpAdd();
        
        while (true)
        {
            var peeked = lexer.peek();
            
            if (peeked == UnknownEnum.Value_27 || peeked == UnknownEnum.Value_28 || peeked == UnknownEnum.Value_25 || peeked == UnknownEnum.Value_26)
            {
                lexer.next();
                var op = __catspeak_operator_from_token(peeked);
                var lhs = result;
                var rhs = __parseOpAdd();
                result = asg.createBinary(op, lhs, rhs, lexer.getLocation());
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
            
            if (peeked == UnknownEnum.Value_22 || peeked == UnknownEnum.Value_21)
            {
                lexer.next();
                var op = __catspeak_operator_from_token(peeked);
                var lhs = result;
                var rhs = __parseOpMultiply();
                result = asg.createBinary(op, lhs, rhs, lexer.getLocation());
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
            
            if (peeked == UnknownEnum.Value_18 || peeked == UnknownEnum.Value_19 || peeked == UnknownEnum.Value_20 || peeked == UnknownEnum.Value_17)
            {
                lexer.next();
                var op = __catspeak_operator_from_token(peeked);
                var lhs = result;
                var rhs = __parseOpUnary();
                result = asg.createBinary(op, lhs, rhs, lexer.getLocation());
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
        
        if (peeked == UnknownEnum.Value_29 || peeked == UnknownEnum.Value_21 || peeked == UnknownEnum.Value_22)
        {
            lexer.next();
            var op = __catspeak_operator_from_token(peeked);
            var value = __parseIndex();
            return asg.createUnary(op, value, lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_6)
        {
            lexer.next();
            return asg.createProperty(__parseTerminal(), lexer.getLocation());
        }
        else
        {
            return __parseIndex();
        }
    };
    
    static __parseIndex = function()
    {
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
                
                result = asg.createCall(result, args, lexer.getLocation());
            }
            else if (peeked == UnknownEnum.Value_2)
            {
                lexer.next();
                var collection = result;
                var key = __parseExpression();
                
                if (lexer.next() != UnknownEnum.Value_3)
                    __ex("expected closing ']' after accessor expression");
                
                result = asg.createAccessor(collection, key, lexer.getLocation());
            }
            else if (peeked == UnknownEnum.Value_9)
            {
                lexer.next();
                var collection = result;
                
                if (lexer.next() != UnknownEnum.Value_56)
                    __ex("expected identifier after '.' operator");
                
                var key = asg.createValue(lexer.getValue(), lexer.getLocation());
                result = asg.createAccessor(collection, key, lexer.getLocation());
            }
            else
            {
                break;
            }
        }
        
        return result;
    };
    
    static __parseTerminal = function()
    {
        var peeked = lexer.peek();
        
        if (peeked == UnknownEnum.Value_57)
        {
            lexer.next();
            return asg.createValue(lexer.getValue(), lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_56)
        {
            lexer.next();
            return asg.createGet(lexer.getValue(), lexer.getLocation());
        }
        else if (peeked == UnknownEnum.Value_54)
        {
            lexer.next();
            return asg.createSelf(lexer.getLocation());
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
            
            return asg.createArray(values, lexer.getLocation());
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
                else if (keyToken == UnknownEnum.Value_56 || keyToken == UnknownEnum.Value_57)
                {
                    key = asg.createValue(lexer.getValue(), lexer.getLocation());
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
                else if (keyToken == UnknownEnum.Value_56)
                {
                    value = asg.createGet(key.value, lexer.getLocation());
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
            
            return asg.createStruct(values, lexer.getLocation());
        }
        else
        {
            __ex("malformed expression, expected: '(', '[' or '{'");
        }
    };
    
    static __ex = function()
    {
        var dbg = __catspeak_location_show(lexer.getLocation()) + " when parsing";
        
        if (argument_count < 1)
        {
            __catspeak_error(dbg);
        }
        else
        {
            var msg = "";
            
            for (var i = 0; i < argument_count; i += 1)
                msg += __catspeak_string(argument[i]);
            
            __catspeak_error(dbg, " -- ", msg, ", got ", __tokenDebug());
        }
    };
    
    static __tokenDebug = function()
    {
        var peeked = lexer.peek();
        
        if (peeked == UnknownEnum.Value_60)
            return "end of file";
        else if (peeked == UnknownEnum.Value_7)
            return "line break ';'";
        
        return "token '" + lexer.getLexeme() + "' (" + string(peeked) + ")";
    };
    
    static __isNot = function(arg0)
    {
        var peeked = lexer.peek();
        return peeked != arg0 && peeked != UnknownEnum.Value_60;
    };
    
    static __is = function(arg0)
    {
        var peeked = lexer.peek();
        return peeked == arg0 && peeked != UnknownEnum.Value_60;
    };
    
    self.lexer = arg0;
    self.asg = arg1;
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
    Value_11 = 11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_17 = 17,
    Value_18,
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
    Value_31 = 31,
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
    Value_46 = 46,
    Value_47,
    Value_48,
    Value_49,
    Value_50,
    Value_51,
    Value_54 = 54,
    Value_56 = 56,
    Value_57,
    Value_60 = 60
}
