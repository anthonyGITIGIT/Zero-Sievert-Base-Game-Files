function KatspeakASGBuilder() : KatspeakIRBuilder() constructor
{
}

function KatspeakIRBuilder() constructor
{
    static get = function()
    {
        return 
        {
            functions: functions,
            entryPoints: topLevelFunctions
        };
    };
    
    static createValue = function(arg0, arg1 = undefined)
    {
        return __createTerm(UnknownEnum.Value_0, arg1, 
        {
            value: arg0
        });
    };
    
    static createArray = function(arg0, arg1 = undefined)
    {
        __katspeak_check_arg("values", arg0, is_array);
        return __createTerm(UnknownEnum.Value_1, arg1, 
        {
            values: arg0
        });
    };
    
    static createStruct = function(arg0, arg1 = undefined)
    {
        __katspeak_check_arg("values", arg0, is_array);
        
        if ((array_length(arg0) % 2) == 1)
            __katspeak_error("expected arg 'values' to be an array with an even ", "number of elements, got ", array_length(arg0));
        
        return __createTerm(UnknownEnum.Value_2, arg1, 
        {
            values: arg0
        });
    };
    
    static __getValue = function(arg0)
    {
        __katspeak_check_arg_struct("term", arg0, "value", undefined);
        return arg0.value;
    };
    
    static createIf = function(arg0, arg1, arg2, arg3 = undefined)
    {
        __katspeak_check_arg_struct("condition", arg0, "type", is_numeric);
        __katspeak_check_arg_struct("ifFalse", arg2, "type", is_numeric);
        
        if (arg0.type == UnknownEnum.Value_0)
        {
            if (__getValue(arg0))
                return arg1;
            else
                return arg2;
        }
        
        if (arg2.type == UnknownEnum.Value_0 && __katspeak_is_nullish(__getValue(arg2)))
        {
            return __createTerm(UnknownEnum.Value_4, arg3, 
            {
                condition: arg0,
                ifTrue: arg1,
                ifFalse: undefined
            });
        }
        else
        {
            return __createTerm(UnknownEnum.Value_4, arg3, 
            {
                condition: arg0,
                ifTrue: arg1,
                ifFalse: arg2
            });
        }
    };
    
    static createMatch = function(arg0, arg1, arg2 = undefined)
    {
        return __createTerm(UnknownEnum.Value_9, arg2, 
        {
            value: arg0,
            arms: arg1
        });
    };
    
    static createAnd = function(arg0, arg1, arg2 = undefined)
    {
        __katspeak_check_arg_struct("eager", arg0, "type", is_numeric);
        
        if (arg0.type == UnknownEnum.Value_0)
        {
            if (__getValue(condition))
                return arg1;
            else
                return arg0;
        }
        
        return __createTerm(UnknownEnum.Value_5, arg2, 
        {
            eager: arg0,
            lazy: arg1
        });
    };
    
    static createOr = function(arg0, arg1, arg2 = undefined)
    {
        __katspeak_check_arg_struct("eager", arg0, "type", is_numeric);
        
        if (arg0.type == UnknownEnum.Value_0)
        {
            if (__getValue(condition))
                return arg0;
            else
                return arg1;
        }
        
        return __createTerm(UnknownEnum.Value_6, arg2, 
        {
            eager: arg0,
            lazy: arg1
        });
    };
    
    static createLoop = function(arg0, arg1, arg2, arg3, arg4 = undefined)
    {
        if (arg0 != undefined)
            __katspeak_check_arg_struct("preCondition", arg0);
        
        if (arg1 != undefined)
            __katspeak_check_arg_struct("postCondition", arg1);
        
        if (arg2 != undefined)
            __katspeak_check_arg_struct("step", arg2);
        
        __katspeak_check_arg_struct("body", arg3);
        return __createTerm(UnknownEnum.Value_7, arg4, 
        {
            preCondition: arg0,
            postCondition: arg1,
            step: arg2,
            body: arg3
        });
    };
    
    static createWhile = function(arg0, arg1, arg2 = undefined)
    {
        return createLoop(arg0, undefined, undefined, arg1, arg2);
    };
    
    static createWith = function(arg0, arg1, arg2 = undefined)
    {
        __katspeak_check_arg_struct("scope", arg0);
        __katspeak_check_arg_struct("body", arg1);
        return __createTerm(UnknownEnum.Value_8, arg2, 
        {
            scope: arg0,
            body: arg1
        });
    };
    
    static createReturn = function(arg0, arg1 = undefined)
    {
        __katspeak_check_arg_struct("value", arg0);
        return __createTerm(UnknownEnum.Value_11, arg1, 
        {
            value: arg0
        });
    };
    
    static createBreak = function(arg0, arg1 = undefined)
    {
        __katspeak_check_arg_struct("value", arg0);
        return __createTerm(UnknownEnum.Value_12, arg1, 
        {
            value: arg0
        });
    };
    
    static createContinue = function(arg0 = undefined)
    {
        return __createTerm(UnknownEnum.Value_13, arg0, {});
    };
    
    static createCall = function(arg0, arg1, arg2 = undefined)
    {
        return __createTerm(UnknownEnum.Value_16, arg2, 
        {
            callee: arg0,
            args: arg1
        });
    };
    
    static createCallNew = function(arg0, arg1, arg2 = undefined)
    {
        return __createTerm(UnknownEnum.Value_17, arg2, 
        {
            callee: arg0,
            args: arg1
        });
    };
    
    static createGet = function(arg0, arg1 = undefined)
    {
        __katspeak_check_arg("name", arg0, is_string);
        var localIdx = undefined;
        
        for (var i = currFunctionScope.blocksTop; __katspeak_is_nullish(localIdx) && i >= 0; i -= 1)
        {
            var scope = ds_list_find_value(currFunctionScope.blocks, i).locals;
            localIdx = ds_map_find_value(scope, arg0);
        }
        
        if (__katspeak_is_nullish(localIdx))
        {
            return __createTerm(UnknownEnum.Value_22, arg1, 
            {
                name: arg0
            });
        }
        else
        {
            return __createTerm(UnknownEnum.Value_21, arg1, 
            {
                idx: localIdx
            });
        }
    };
    
    static createAccessor = function(arg0, arg1, arg2 = undefined)
    {
        return __createTerm(UnknownEnum.Value_19, arg2, 
        {
            collection: arg0,
            key: arg1
        });
    };
    
    static createProperty = function(arg0, arg1 = undefined)
    {
        return __createTerm(UnknownEnum.Value_20, arg1, 
        {
            property: arg0
        });
    };
    
    static createParams = function(arg0, arg1 = undefined)
    {
        return __createTerm(UnknownEnum.Value_24, arg1, 
        {
            key: arg0
        });
    };
    
    static createParamsCount = function(arg0 = undefined)
    {
        return __createTerm(UnknownEnum.Value_25, arg0, {});
    };
    
    static createBinary = function(arg0, arg1, arg2, arg3 = undefined)
    {
        __katspeak_check_arg("operator", arg0, is_numeric);
        __katspeak_check_arg_struct("lhs", arg1, "type", is_numeric);
        __katspeak_check_arg_struct("rhs", arg2, "type", is_numeric);
        
        if (arg1.type == UnknownEnum.Value_0 && arg2.type == UnknownEnum.Value_0)
        {
            __katspeak_check_arg_struct("lhs", arg1, "value", undefined);
            __katspeak_check_arg_struct("rhs", arg2, "value", undefined);
            var opFunc = __katspeak_operator_get_binary(arg0);
            arg1.value = opFunc(arg1.value, arg2.value);
            return arg1;
        }
        
        return __createTerm(UnknownEnum.Value_14, arg3, 
        {
            operator: arg0,
            lhs: arg1,
            rhs: arg2
        });
    };
    
    static createUnary = function(arg0, arg1, arg2 = undefined)
    {
        __katspeak_check_arg("operator", arg0, is_numeric);
        __katspeak_check_arg_struct("value", arg1, "type", is_numeric);
        
        if (arg1.type == UnknownEnum.Value_0)
        {
            __katspeak_check_arg_struct("value", arg1, "value", undefined);
            var opFunc = __katspeak_operator_get_unary(arg0);
            arg1.value = opFunc(arg1.value);
            return arg1;
        }
        
        return __createTerm(UnknownEnum.Value_15, arg2, 
        {
            operator: arg0,
            value: arg1
        });
    };
    
    static createSelf = function(arg0 = undefined)
    {
        return __createTerm(UnknownEnum.Value_26, arg0, {});
    };
    
    static createAssign = function(arg0, arg1, arg2, arg3 = undefined)
    {
        __katspeak_check_arg("type", arg0, is_numeric);
        
        if (arg0 == UnknownEnum.Value_0)
        {
            __katspeak_check_arg_struct("lhs", arg1, "type", is_numeric);
            __katspeak_check_arg_struct("rhs", arg2, "type", is_numeric);
            var lhsType = arg1.type;
            
            if (lhsType == UnknownEnum.Value_21)
            {
                if (arg2.type == UnknownEnum.Value_21)
                {
                    __katspeak_check_arg_struct("lhs", arg1, "idx", is_numeric);
                    __katspeak_check_arg_struct("rhs", arg2, "idx", is_numeric);
                    
                    if (arg1.idx == arg2.idx)
                        return createValue(undefined, arg3);
                }
            }
            else if (lhsType == UnknownEnum.Value_22)
            {
                if (arg2.type == UnknownEnum.Value_22)
                {
                    __katspeak_check_arg_struct("lhs", arg1, "name", is_string);
                    __katspeak_check_arg_struct("rhs", arg2, "name", is_string);
                    
                    if (arg1.name == arg2.name)
                        return createValue(undefined, arg3);
                }
            }
        }
        
        return __createTerm(UnknownEnum.Value_18, arg3, 
        {
            assignType: arg0,
            target: arg1,
            value: arg2
        });
    };
    
    static createStatement = function(arg0)
    {
        var block = ds_list_find_value(currFunctionScope.blocks, currFunctionScope.blocksTop);
        var result_ = block.result;
        
        if (result_ != undefined)
            ds_list_add(block.inheritedTerms ?? block.terms, result_);
        
        block.result = arg0;
    };
    
    static allocLocal = function(arg0, arg1 = undefined)
    {
        __katspeak_check_arg("name", arg0, is_string);
        var block = ds_list_find_value(currFunctionScope.blocks, currFunctionScope.blocksTop);
        var scope = block.locals;
        
        if (ds_map_exists(scope, arg0))
            __katspeak_error(__katspeak_location_show(arg1), " -- a local variable with the name '", arg0, "' is already ", "defined in this scope");
        
        block.localCount += 1;
        var localIdx = currFunctionScope.nextLocalIdx;
        var nextLocalIdx_ = localIdx + 1;
        currFunctionScope.nextLocalIdx = nextLocalIdx_;
        
        if (nextLocalIdx_ > currFunctionScope.localCount)
            currFunctionScope.localCount = nextLocalIdx_;
        
        ds_map_set(scope, arg0, localIdx);
        return __createTerm(UnknownEnum.Value_21, arg1, 
        {
            idx: localIdx
        });
    };
    
    static allocLocalOrReuse = function(arg0, arg1 = undefined)
    {
        __katspeak_check_arg("name", arg0, is_string);
        var block = ds_list_find_value(currFunctionScope.blocks, currFunctionScope.blocksTop);
        var scope = block.locals;
        
        if (ds_map_exists(scope, arg0))
        {
            return __createTerm(UnknownEnum.Value_21, arg1, 
            {
                idx: ds_map_find_value(scope, arg0)
            });
        }
        else
        {
            return allocLocal(arg0, arg1);
        }
    };
    
    static allocArg = function(arg0, arg1 = undefined)
    {
        __katspeak_check_arg("name", arg0, is_string);
        var local = allocLocal(arg0, arg1);
        
        if (currFunctionScope.argCount != local.idx)
            __katspeak_error("must allocate all function arguments before ", "allocating any local variables");
        
        currFunctionScope.argCount += 1;
        return local;
    };
    
    static pushBlock = function(arg0 = false)
    {
        __katspeak_check_arg("inherit", arg0, is_numeric);
        var blocks_ = currFunctionScope.blocks;
        var blocksTop_ = currFunctionScope.blocksTop + 1;
        currFunctionScope.blocksTop = blocksTop_;
        var block = ds_list_find_value(blocks_, blocksTop_);
        var inheritedTerms = undefined;
        
        if (arg0)
        {
            var blockParent = ds_list_find_value(blocks_, blocksTop_ - 1);
            inheritedTerms = blockParent.inheritedTerms ?? blockParent.terms;
        }
        
        if (__katspeak_is_nullish(block))
        {
            ds_list_add(blocks_, 
            {
                locals: __katspeak_alloc_ds_map(self),
                terms: __katspeak_alloc_ds_list(self),
                inheritedTerms: inheritedTerms,
                result: undefined,
                localCount: 0
            });
        }
        else
        {
            ds_map_clear(block.locals);
            ds_list_clear(block.terms);
            block.inheritedTerms = inheritedTerms;
            block.result = undefined;
            block.localCount = 0;
        }
    };
    
    static popBlock = function(arg0 = undefined)
    {
        var block = ds_list_find_value(currFunctionScope.blocks, currFunctionScope.blocksTop);
        currFunctionScope.nextLocalIdx -= block.localCount;
        currFunctionScope.blocksTop -= 1;
        var result_ = block.result;
        
        if (block.inheritedTerms != undefined)
            return result_ ?? createValue(undefined, arg0);
        
        var terms = block.terms;
        
        if (result_ != undefined)
            ds_list_add(terms, result_);
        
        var termCount = ds_list_size(terms);
        var finalTerms = array_create(termCount);
        var finalCount = 0;
        var prevTermIsPure = false;
        
        for (var i = 0; i < termCount; i += 1)
        {
            var term = ds_list_find_value(terms, i);
            
            if (prevTermIsPure)
                finalCount -= 1;
            
            finalTerms[finalCount] = term;
            finalCount += 1;
            prevTermIsPure = __katspeak_term_is_pure(term.type);
        }
        
        if (finalCount == 0)
        {
            return createValue(undefined, arg0);
        }
        else if (finalCount == 1)
        {
            return finalTerms[0];
        }
        else
        {
            var blockLocation = arg0 ?? ds_list_find_value(terms, 0).dbg;
            array_resize(finalTerms, finalCount);
            return __createTerm(UnknownEnum.Value_3, blockLocation, 
            {
                terms: finalTerms
            });
        }
    };
    
    static pushFunction = function()
    {
        var functionScopes_ = functionScopes;
        var functionScopesTop_ = functionScopesTop + 1;
        functionScopesTop = functionScopesTop_;
        var function_ = ds_list_find_value(functionScopes_, functionScopesTop_);
        
        if (__katspeak_is_nullish(function_))
        {
            function_ = 
            {
                blocks: __katspeak_alloc_ds_list(self),
                blocksTop: -1,
                nextLocalIdx: 0,
                localCount: 0,
                argCount: 0
            };
            ds_list_add(functionScopes_, function_);
        }
        else
        {
            ds_list_clear(function_.blocks);
            function_.blocksTop = -1;
            function_.nextLocalIdx = 0;
            function_.localCount = 0;
            function_.argCount = 0;
        }
        
        currFunctionScope = function_;
        pushBlock();
    };
    
    static popFunction = function(arg0 = undefined)
    {
        var idx = array_length(functions);
        functions[idx] = 
        {
            localCount: currFunctionScope.localCount,
            argCount: currFunctionScope.argCount,
            root: popBlock()
        };
        functionScopesTop -= 1;
        
        if (functionScopesTop < 0)
        {
            array_push(topLevelFunctions, idx);
            currFunctionScope = undefined;
        }
        else
        {
            currFunctionScope = ds_list_find_value(functionScopes, functionScopesTop);
        }
        
        return __createTerm(UnknownEnum.Value_23, arg0, 
        {
            idx: idx
        });
    };
    
    static __createTerm = function(arg0, arg1, arg2)
    {
        if (true && arg1 != undefined)
            __katspeak_check_arg_size_bits("location", arg1, 32);
        
        arg2.type = arg0;
        arg2.dbg = arg1;
        return arg2;
    };
    
    self.functions = [];
    self.topLevelFunctions = [];
    self.functionScopes = __katspeak_alloc_ds_list(self);
    self.functionScopesTop = -1;
    self.currFunctionScope = undefined;
}

function __katspeak_term_is_pure(arg0)
{
    return arg0 == UnknownEnum.Value_0 || arg0 == UnknownEnum.Value_21 || arg0 == UnknownEnum.Value_22 || arg0 == UnknownEnum.Value_23 || arg0 == UnknownEnum.Value_26;
}

function __katspeak_term_get_terminal(arg0)
{
    __katspeak_check_arg_struct("term", arg0, "type", is_numeric);
    
    if (arg0.type == UnknownEnum.Value_22)
    {
        __katspeak_check_arg_struct("term", arg0, "name", undefined);
        return arg0.name;
    }
    else if (arg0.type == UnknownEnum.Value_26)
    {
        return "self";
    }
    else if (arg0.type == UnknownEnum.Value_0)
    {
        __katspeak_check_arg_struct("term", arg0, "value", undefined);
        return string(arg0.value);
    }
    
    return undefined;
}

function __katspeak_operator_from_token(arg0)
{
    return arg0 - UnknownEnum.Value_17 - 1;
}

function __katspeak_operator_assign_from_token(arg0)
{
    return arg0 - UnknownEnum.Value_11 - 1;
}

function __katspeak_operator_get_binary(arg0)
{
    var opFunc = global.__katspeakBinOps[arg0];
    
    if (true && __katspeak_is_nullish(opFunc))
        __katspeak_error_bug();
    
    return opFunc;
}

function __katspeak_operator_get_unary(arg0)
{
    var opFunc = global.__katspeakUnaryOps[arg0];
    
    if (true && __katspeak_is_nullish(opFunc))
        __katspeak_error_bug();
    
    return opFunc;
}

function __katspeak_op_remainder(arg0, arg1)
{
    return arg0 % arg1;
}

function __katspeak_op_multiply(arg0, arg1)
{
    return arg0 * arg1;
}

function __katspeak_op_divide(arg0, arg1)
{
    return arg0 / arg1;
}

function __katspeak_op_divide_int(arg0, arg1)
{
    return arg0 div arg1;
}

function __katspeak_op_subtract(arg0, arg1)
{
    return arg0 - arg1;
}

function __katspeak_op_plus(arg0, arg1)
{
    return arg0 + arg1;
}

function __katspeak_op_equal(arg0, arg1)
{
    return arg0 == arg1;
}

function __katspeak_op_not_equal(arg0, arg1)
{
    return arg0 != arg1;
}

function __katspeak_op_greater(arg0, arg1)
{
    return arg0 > arg1;
}

function __katspeak_op_greater_equal(arg0, arg1)
{
    return arg0 >= arg1;
}

function __katspeak_op_less(arg0, arg1)
{
    return arg0 < arg1;
}

function __katspeak_op_less_equal(arg0, arg1)
{
    return arg0 <= arg1;
}

function __katspeak_op_shift_right(arg0, arg1)
{
    return arg0 >> arg1;
}

function __katspeak_op_shift_left(arg0, arg1)
{
    return arg0 << arg1;
}

function __katspeak_op_bitwise_and(arg0, arg1)
{
    return arg0 & arg1;
}

function __katspeak_op_bitwise_xor(arg0, arg1)
{
    return arg0 ^ arg1;
}

function __katspeak_op_bitwise_or(arg0, arg1)
{
    return arg0 | arg1;
}

function __katspeak_op_xor(arg0, arg1)
{
    return arg0 ^^ arg1;
}

function __katspeak_op_subtract_unary(arg0)
{
    return -arg0;
}

function __katspeak_op_plus_unary(arg0)
{
    return arg0;
}

function __katspeak_op_not_unary(arg0)
{
    return !arg0;
}

function __katspeak_op_bitwise_not_unary(arg0)
{
    return ~arg0;
}

function __katspeak_init_operators()
{
    var binOps = array_create(UnknownEnum.Value_20, undefined);
    var unaryOps = array_create(UnknownEnum.Value_20, undefined);
    binOps[UnknownEnum.Value_0] = __katspeak_op_remainder;
    binOps[UnknownEnum.Value_1] = __katspeak_op_multiply;
    binOps[UnknownEnum.Value_2] = __katspeak_op_divide;
    binOps[UnknownEnum.Value_3] = __katspeak_op_divide_int;
    binOps[UnknownEnum.Value_4] = __katspeak_op_subtract;
    binOps[UnknownEnum.Value_5] = __katspeak_op_plus;
    binOps[UnknownEnum.Value_6] = __katspeak_op_equal;
    binOps[UnknownEnum.Value_7] = __katspeak_op_not_equal;
    binOps[UnknownEnum.Value_8] = __katspeak_op_greater;
    binOps[UnknownEnum.Value_9] = __katspeak_op_greater_equal;
    binOps[UnknownEnum.Value_10] = __katspeak_op_less;
    binOps[UnknownEnum.Value_11] = __katspeak_op_less_equal;
    binOps[UnknownEnum.Value_14] = __katspeak_op_shift_right;
    binOps[UnknownEnum.Value_15] = __katspeak_op_shift_left;
    binOps[UnknownEnum.Value_16] = __katspeak_op_bitwise_and;
    binOps[UnknownEnum.Value_17] = __katspeak_op_bitwise_xor;
    binOps[UnknownEnum.Value_18] = __katspeak_op_bitwise_or;
    unaryOps[UnknownEnum.Value_4] = __katspeak_op_subtract_unary;
    unaryOps[UnknownEnum.Value_5] = __katspeak_op_plus_unary;
    unaryOps[UnknownEnum.Value_12] = __katspeak_op_not_unary;
    unaryOps[UnknownEnum.Value_13] = __katspeak_op_bitwise_not_unary;
    binOps[UnknownEnum.Value_19] = __katspeak_op_xor;
    global.__katspeakBinOps = binOps;
    global.__katspeakUnaryOps = unaryOps;
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
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26
}
