function CatspeakASGBuilder() : CatspeakIRBuilder() constructor
{
}

function CatspeakIRBuilder() constructor
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
        return __createTerm(UnknownEnum.Value_1, arg1, 
        {
            values: arg0
        });
    };
    
    static createStruct = function(arg0, arg1 = undefined)
    {
        return __createTerm(UnknownEnum.Value_2, arg1, 
        {
            values: arg0
        });
    };
    
    static __getValue = function(arg0)
    {
        return arg0.value;
    };
    
    static createIf = function(arg0, arg1, arg2, arg3 = undefined)
    {
        if (arg0.type == UnknownEnum.Value_0)
        {
            if (__getValue(arg0))
                return arg1;
            else
                return arg2;
        }
        
        if (arg2.type == UnknownEnum.Value_0 && __getValue(arg2) == undefined)
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
    
    static createAnd = function(arg0, arg1, arg2 = undefined)
    {
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
    
    static createWhile = function(arg0, arg1, arg2 = undefined)
    {
        if (arg0.type == UnknownEnum.Value_0 && !__getValue(arg0))
            return createValue(undefined, arg0.dbg);
        
        return __createTerm(UnknownEnum.Value_7, arg2, 
        {
            condition: arg0,
            body: arg1
        });
    };
    
    static createUse = function(arg0, arg1, arg2 = undefined)
    {
        return __createTerm(UnknownEnum.Value_8, arg2, 
        {
            condition: arg0,
            body: arg1
        });
    };
    
    static createReturn = function(arg0, arg1 = undefined)
    {
        return __createTerm(UnknownEnum.Value_9, arg1, 
        {
            value: arg0
        });
    };
    
    static createBreak = function(arg0, arg1 = undefined)
    {
        return __createTerm(UnknownEnum.Value_10, arg1, 
        {
            value: arg0
        });
    };
    
    static createContinue = function(arg0 = undefined)
    {
        return __createTerm(UnknownEnum.Value_11, arg0, {});
    };
    
    static createCall = function(arg0, arg1, arg2 = undefined)
    {
        return __createTerm(UnknownEnum.Value_14, arg2, 
        {
            callee: arg0,
            args: arg1
        });
    };
    
    static createGet = function(arg0, arg1 = undefined)
    {
        var localIdx = undefined;
        
        for (var i = currFunctionScope.blocksTop; localIdx == undefined && i >= 0; i -= 1)
        {
            var scope = ds_list_find_value(currFunctionScope.blocks, i).locals;
            localIdx = ds_map_find_value(scope, arg0);
        }
        
        if (localIdx == undefined)
        {
            return __createTerm(UnknownEnum.Value_19, arg1, 
            {
                name: arg0
            });
        }
        else
        {
            return __createTerm(UnknownEnum.Value_18, arg1, 
            {
                idx: localIdx
            });
        }
    };
    
    static createAccessor = function(arg0, arg1, arg2 = undefined)
    {
        return __createTerm(UnknownEnum.Value_16, arg2, 
        {
            collection: arg0,
            key: arg1
        });
    };
    
    static createProperty = function(arg0, arg1 = undefined)
    {
        return __createTerm(UnknownEnum.Value_17, arg1, 
        {
            property: arg0
        });
    };
    
    static createBinary = function(arg0, arg1, arg2, arg3 = undefined)
    {
        if (arg1.type == UnknownEnum.Value_0 && arg2.type == UnknownEnum.Value_0)
        {
            var opFunc = __catspeak_operator_get_binary(arg0);
            arg1.value = opFunc(arg1.value, arg2.value);
            return arg1;
        }
        
        return __createTerm(UnknownEnum.Value_12, arg3, 
        {
            operator: arg0,
            lhs: arg1,
            rhs: arg2
        });
    };
    
    static createUnary = function(arg0, arg1, arg2 = undefined)
    {
        if (arg1.type == UnknownEnum.Value_0)
        {
            var opFunc = __catspeak_operator_get_unary(arg0);
            arg1.value = opFunc(arg1.value);
            return arg1;
        }
        
        return __createTerm(UnknownEnum.Value_13, arg2, 
        {
            operator: arg0,
            value: arg1
        });
    };
    
    static createSelf = function(arg0 = undefined)
    {
        return __createTerm(UnknownEnum.Value_21, arg0, {});
    };
    
    static createAssign = function(arg0, arg1, arg2, arg3 = undefined)
    {
        if (arg0 == UnknownEnum.Value_0)
        {
            var lhsType = arg1.type;
            
            if (lhsType == UnknownEnum.Value_18)
            {
                if (arg2.type == UnknownEnum.Value_18)
                {
                    if (arg1.idx == arg2.idx)
                        return createValue(undefined, arg3);
                }
            }
            else if (lhsType == UnknownEnum.Value_19)
            {
                if (arg2.type == UnknownEnum.Value_19)
                {
                    if (arg1.name == arg2.name)
                        return createValue(undefined, arg3);
                }
            }
        }
        
        return __createTerm(UnknownEnum.Value_15, arg3, 
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
        var block = ds_list_find_value(currFunctionScope.blocks, currFunctionScope.blocksTop);
        var scope = block.locals;
        
        if (ds_map_exists(scope, arg0))
            __catspeak_error(__catspeak_location_show(arg1), " -- a local variable with the name '", arg0, "' is already ", "defined in this scope");
        
        block.localCount += 1;
        var localIdx = currFunctionScope.nextLocalIdx;
        var nextLocalIdx_ = localIdx + 1;
        currFunctionScope.nextLocalIdx = nextLocalIdx_;
        
        if (nextLocalIdx_ > currFunctionScope.localCount)
            currFunctionScope.localCount = nextLocalIdx_;
        
        ds_map_set(scope, arg0, localIdx);
        return __createTerm(UnknownEnum.Value_18, arg1, 
        {
            idx: localIdx
        });
    };
    
    static allocArg = function(arg0, arg1 = undefined)
    {
        var local = allocLocal(arg0, arg1);
        
        if (currFunctionScope.argCount != local.idx)
            __catspeak_error("must allocate all function arguments before ", "allocating any local variables");
        
        currFunctionScope.argCount += 1;
        return local;
    };
    
    static pushBlock = function(arg0 = false)
    {
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
        
        if (block == undefined)
        {
            ds_list_add(blocks_, 
            {
                locals: __catspeak_alloc_ds_map(self),
                terms: __catspeak_alloc_ds_list(self),
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
            prevTermIsPure = __catspeak_term_is_pure(term.type);
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
        
        if (function_ == undefined)
        {
            function_ = 
            {
                blocks: __catspeak_alloc_ds_list(self),
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
        
        return __createTerm(UnknownEnum.Value_20, arg0, 
        {
            idx: idx
        });
    };
    
    static __createTerm = function(arg0, arg1, arg2)
    {
        if (false && arg1 != undefined)
            __catspeak_check_arg_size_bits("location", arg1, 32);
        
        arg2.type = arg0;
        arg2.dbg = arg1;
        return arg2;
    };
    
    self.functions = [];
    self.topLevelFunctions = [];
    self.functionScopes = __catspeak_alloc_ds_list(self);
    self.functionScopesTop = -1;
    self.currFunctionScope = undefined;
}

function __catspeak_term_is_pure(arg0)
{
    return arg0 == UnknownEnum.Value_0 || arg0 == UnknownEnum.Value_18 || arg0 == UnknownEnum.Value_19 || arg0 == UnknownEnum.Value_20 || arg0 == UnknownEnum.Value_21;
}

function __catspeak_term_get_terminal(arg0)
{
    if (arg0.type == UnknownEnum.Value_19)
        return arg0.name;
    else if (arg0.type == UnknownEnum.Value_21)
        return "self";
    else if (arg0.type == UnknownEnum.Value_0)
        return string(arg0.value);
    
    return undefined;
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
    Value_21
}
