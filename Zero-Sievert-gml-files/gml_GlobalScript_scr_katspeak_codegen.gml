function __katspeak_infer_function_name(arg0)
{
    if (is_method(arg0))
    {
        var name = struct_get_from_hash(arg0, variable_get_hash("name"));
        
        if (is_string(name))
            return name;
        
        arg0 = method_get_index(arg0);
    }
    
    return script_get_name(arg0);
}

function is_katspeak(arg0)
{
    if (!is_method(arg0))
        return false;
    
    var scr = method_get_index(arg0);
    
    if (scr == __katspeak_function__)
        return true;
    
    var scrName = script_get_name(scr);
    return string_starts_with(scrName, "__katspeak_");
}

function __katspeak_timeout_check(arg0)
{
    if ((current_time - arg0) > 1000)
        __katspeak_error("process exceeded allowed time of ", 1000, " ms");
}

function KatspeakGMLCompiler(arg0, arg1 = undefined) constructor
{
    static __get = function(arg0)
    {
        if (__katspeak_is_nullish(interface))
            return undefined;
        
        return interface.get(arg0);
    };
    
    static __exists = function(arg0)
    {
        if (__katspeak_is_nullish(interface))
            return undefined;
        
        return interface.exists(arg0);
    };
    
    static __isDynamicConstant = function(arg0)
    {
        if (__katspeak_is_nullish(interface))
            return false;
        
        return interface.isDynamicConstant(arg0);
    };
    
    static update = function()
    {
        if (true && finalised)
            __katspeak_error("attempting to update gml compiler after it has been finalised");
        
        finalised = true;
        return program;
    };
    
    static __compileFunctions = function(arg0)
    {
        var functions_ = functions;
        var entryCount = array_length(arg0);
        var exprs = array_create(entryCount);
        
        for (var i = 0; i < entryCount; i += 1)
        {
            var entry = arg0[i];
            __katspeak_check_arg("entry", entry, is_numeric);
            exprs[i] = __compileFunction(functions_[entry]);
        }
        
        var rootCall = __emitBlock(exprs);
        __setupKatspeakFunctionMethods(rootCall);
        return rootCall;
    };
    
    static __setupKatspeakFunctionMethods = function(arg0)
    {
        arg0.setSelf = method(sharedData, function(arg0)
        {
            self_ = katspeak_special_to_struct(arg0);
        });
        arg0.setGlobals = method(sharedData, function(arg0)
        {
            globals = katspeak_special_to_struct(arg0);
        });
        arg0.getSelf = method(sharedData, function()
        {
            return self_ ?? globals;
        });
        arg0.getGlobals = method(sharedData, function()
        {
            return globals;
        });
    };
    
    static __compileFunction = function(arg0)
    {
        __katspeak_check_arg_struct("func", arg0, "localCount", is_numeric, "argCount", is_numeric, "root", undefined);
        __katspeak_check_arg_struct("func.root", arg0.root, "type", is_numeric);
        var ctx = 
        {
            callTime: -1,
            program: undefined,
            locals: array_create(arg0.localCount),
            argCount: arg0.argCount,
            args: array_create(arg0.argCount),
            currentArgCount: 0
        };
        ctx.program = __compileTerm(ctx, arg0.root);
        
        if (__katspeak_term_is_pure(arg0.root.type))
            return ctx.program;
        
        return method(ctx, __katspeak_function__);
    };
    
    static __compileValue = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "value", undefined);
        return method(
        {
            value: arg1.value
        }, __katspeak_expr_value__);
    };
    
    static __compileArray = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "values", is_array);
        var values = arg1.values;
        var valueCount = array_length(values);
        var exprs = array_create(valueCount);
        
        for (var i = 0; i < valueCount; i += 1)
            exprs[i] = __compileTerm(arg0, values[i]);
        
        return method(
        {
            values: exprs,
            n: array_length(exprs)
        }, __katspeak_expr_array__);
    };
    
    static __compileStruct = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "values", is_array);
        var values = arg1.values;
        var valueCount = array_length(values);
        var exprs = array_create(valueCount);
        
        for (var i = 0; i < valueCount; i += 1)
            exprs[i] = __compileTerm(arg0, values[i]);
        
        return method(
        {
            values: exprs,
            n: array_length(exprs) div 2
        }, __katspeak_expr_struct__);
    };
    
    static __compileBlock = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "terms", is_array);
        var terms = arg1.terms;
        var termCount = array_length(terms);
        var exprs = array_create(termCount);
        
        for (var i = 0; i < termCount; i += 1)
            exprs[i] = __compileTerm(arg0, terms[i]);
        
        return __emitBlock(exprs);
    };
    
    static __emitBlock = function(arg0)
    {
        var exprCount = array_length(arg0);
        
        if (exprCount == 1)
        {
            return arg0[0];
        }
        else if (exprCount == 2)
        {
            return method(
            {
                _1st: arg0[0],
                _2nd: arg0[1]
            }, __katspeak_expr_block_2__);
        }
        else if (exprCount == 3)
        {
            return method(
            {
                _1st: arg0[0],
                _2nd: arg0[1],
                _3rd: arg0[2]
            }, __katspeak_expr_block_3__);
        }
        else if (exprCount == 4)
        {
            return method(
            {
                _1st: arg0[0],
                _2nd: arg0[1],
                _3rd: arg0[2],
                _4th: arg0[3]
            }, __katspeak_expr_block_4__);
        }
        else if (exprCount == 5)
        {
            return method(
            {
                _1st: arg0[0],
                _2nd: arg0[1],
                _3rd: arg0[2],
                _4th: arg0[3],
                _5th: arg0[4]
            }, __katspeak_expr_block_5__);
        }
        
        return method(
        {
            stmts: arg0,
            n: exprCount - 1,
            result: arg0[exprCount - 1]
        }, __katspeak_expr_block__);
    };
    
    static __compileIf = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "condition", undefined, "ifTrue", undefined, "ifFalse", undefined);
        
        if (__katspeak_is_nullish(arg1.ifFalse))
        {
            return method(
            {
                condition: __compileTerm(arg0, arg1.condition),
                ifTrue: __compileTerm(arg0, arg1.ifTrue)
            }, __katspeak_expr_if__);
        }
        else
        {
            return method(
            {
                condition: __compileTerm(arg0, arg1.condition),
                ifTrue: __compileTerm(arg0, arg1.ifTrue),
                ifFalse: __compileTerm(arg0, arg1.ifFalse)
            }, __katspeak_expr_if_else__);
        }
    };
    
    static __compileLoop = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "preCondition", undefined, "postCondition", undefined, "step", undefined, "body", undefined);
        var preCondition_ = (arg1.preCondition == undefined) ? undefined : __compileTerm(arg0, arg1.preCondition);
        var body_ = (arg1.body == undefined) ? undefined : __compileTerm(arg0, arg1.body);
        var postCondition_ = (arg1.postCondition == undefined) ? undefined : __compileTerm(arg0, arg1.postCondition);
        var step_ = (arg1.step == undefined) ? undefined : __compileTerm(arg0, arg1.step);
        
        if (preCondition_ != undefined && postCondition_ == undefined)
        {
            if (arg1.step == undefined)
            {
                return method(
                {
                    ctx: arg0,
                    condition: preCondition_,
                    body: body_
                }, __katspeak_expr_loop_while__);
            }
            else
            {
                return method(
                {
                    ctx: arg0,
                    condition: preCondition_,
                    body: body_,
                    step: step_
                }, __katspeak_expr_loop_for__);
            }
        }
        
        if (preCondition_ == undefined && postCondition_ != undefined && step_ == undefined)
        {
            return method(
            {
                ctx: arg0,
                condition: postCondition_,
                body: body_
            }, __katspeak_expr_loop_do__);
        }
        
        return method(
        {
            ctx: arg0,
            preCondition: preCondition_,
            postCondition: postCondition_,
            step: step_,
            body: body_
        }, __katspeak_expr_loop_general__);
    };
    
    static __compileWith = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "scope", undefined, "body", undefined);
        return method(
        {
            scope: __compileTerm(arg0, arg1.scope),
            body: __compileTerm(arg0, arg1.body)
        }, __katspeak_expr_loop_with__);
    };
    
    static __compileMatch = function(arg0, arg1)
    {
        var i = 0;
        var n = array_length(arg1.arms);
        
        repeat (n)
        {
            var pair = arg1.arms[i];
            var condition = __katspeak_is_nullish(pair[0]) ? undefined : __compileTerm(arg0, pair[0]);
            arg1.arms[i] = 
            {
                condition: condition,
                result: __compileTerm(arg0, pair[1])
            };
            i += 1;
        }
        
        return method(
        {
            value: __compileTerm(arg0, arg1.value),
            arms: arg1.arms
        }, __katspeak_expr_match__);
    };
    
    static __compileReturn = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "value", undefined);
        return method(
        {
            value: __compileTerm(arg0, arg1.value)
        }, __katspeak_expr_return__);
    };
    
    static __compileBreak = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "value", undefined);
        return method(
        {
            value: __compileTerm(arg0, arg1.value)
        }, __katspeak_expr_break__);
    };
    
    static __compileContinue = function(arg0, arg1)
    {
        return method(undefined, __katspeak_expr_continue__);
    };
    
    static __compileOpUnary = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "operator", is_numeric, "value", undefined);
        return method(
        {
            op: __katspeak_operator_get_unary(arg1.operator),
            value: __compileTerm(arg0, arg1.value)
        }, __katspeak_expr_op_1__);
    };
    
    static __compileOpBinary = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "operator", is_numeric, "lhs", undefined, "rhs", undefined);
        return method(
        {
            op: __katspeak_operator_get_binary(arg1.operator),
            lhs: __compileTerm(arg0, arg1.lhs),
            rhs: __compileTerm(arg0, arg1.rhs)
        }, __katspeak_expr_op_2__);
    };
    
    static __compileAnd = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "eager", undefined, "lazy", undefined);
        return method(
        {
            eager: __compileTerm(arg0, arg1.eager),
            lazy: __compileTerm(arg0, arg1.lazy)
        }, __katspeak_expr_and__);
    };
    
    static __compileOr = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "eager", undefined, "lazy", undefined);
        return method(
        {
            eager: __compileTerm(arg0, arg1.eager),
            lazy: __compileTerm(arg0, arg1.lazy)
        }, __katspeak_expr_or__);
    };
    
    static __compileCall = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "callee", undefined, "args", undefined);
        __katspeak_check_arg_struct("term.callee", arg1.callee, "type", is_numeric);
        var args = arg1.args;
        var argCount = array_length(args);
        var exprs = array_create(argCount);
        
        for (var i = 0; i < argCount; i += 1)
            exprs[i] = __compileTerm(arg0, args[i]);
        
        var dbgError = __dbgTerm(arg1.callee, "is not a function");
        
        if (arg1.callee.type == UnknownEnum.Value_19)
        {
            __katspeak_check_arg_struct("term.callee", arg1.callee, "collection", undefined, "key", undefined);
            var collection = __compileTerm(arg0, arg1.callee.collection);
            var key = __compileTerm(arg0, arg1.callee.key);
            return method(
            {
                dbgError: dbgError,
                collection: collection,
                key: key,
                args: exprs,
                shared: sharedData
            }, __katspeak_expr_call_method__);
        }
        else
        {
            var callee = __compileTerm(arg0, arg1.callee);
            var func = __katspeak_expr_call__;
            
            switch (array_length(exprs))
            {
                case 0:
                    func = __katspeak_expr_call_0__;
                    break;
                
                case 1:
                    func = __katspeak_expr_call_1__;
                    break;
                
                case 2:
                    func = __katspeak_expr_call_2__;
                    break;
                
                case 3:
                    func = __katspeak_expr_call_3__;
                    break;
            }
            
            return method(
            {
                dbgError: dbgError,
                callee: callee,
                args: exprs,
                shared: sharedData
            }, func);
        }
    };
    
    static __compileCallNew = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "callee", undefined, "args", undefined);
        __katspeak_check_arg_struct("term.callee", arg1.callee, "type", is_numeric);
        var args = arg1.args;
        var argCount = array_length(args);
        var exprs = array_create(argCount);
        
        for (var i = 0; i < argCount; i += 1)
            exprs[i] = __compileTerm(arg0, args[i]);
        
        var callee = __compileTerm(arg0, arg1.callee);
        return method(
        {
            dbgError: __dbgTerm(arg1.callee, "is not constructible"),
            callee: callee,
            args: exprs
        }, __katspeak_expr_call_new__);
    };
    
    static __compileSet = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "assignType", is_numeric, "target", undefined, "value", undefined);
        __katspeak_check_arg_struct("term.target", arg1.target, "type", is_numeric);
        var target = arg1.target;
        var targetType = target.type;
        var value = __compileTerm(arg0, arg1.value);
        
        if (targetType == UnknownEnum.Value_19)
        {
            __katspeak_check_arg_struct("term.target", target, "collection", undefined, "key", undefined);
            var func = __assignLookupIndex[arg1.assignType];
            return method(
            {
                dbgError: __dbgTerm(target.collection, "is not indexable"),
                collection: __compileTerm(arg0, target.collection),
                key: __compileTerm(arg0, target.key),
                value: value
            }, func);
        }
        else if (targetType == UnknownEnum.Value_20)
        {
            __katspeak_check_arg_struct("term.target", target, "property", undefined);
            var func = __assignLookupProperty[arg1.assignType];
            return method(
            {
                dbgError: __dbgTerm(target.property, "is not a function"),
                property: __compileTerm(arg0, target.property),
                value: value
            }, func);
        }
        else if (targetType == UnknownEnum.Value_21)
        {
            __katspeak_check_arg_struct("term.target", target, "idx", is_numeric);
            var func = __assignLookupLocal[arg1.assignType];
            return method(
            {
                locals: arg0.locals,
                idx: target.idx,
                value: value
            }, func);
        }
        else if (targetType == UnknownEnum.Value_22)
        {
            __katspeak_check_arg_struct("term.target", target, "name", is_string);
            var name = target.name;
            
            if (__exists(name))
                __katspeak_error(__katspeak_location_show(target.dbg), " -- invalid assignment target, ", "cannot assign to built-in function or constant");
            
            var func = __assignLookupGlobal[arg1.assignType];
            return method(
            {
                shared: sharedData,
                name: name,
                value: value
            }, func);
        }
        else
        {
            __katspeak_check_arg_struct("term.target", target, "dbg", undefined);
            __katspeak_error(__katspeak_location_show(target.dbg), " -- invalid assignment target, ", "must be an identifier or accessor expression");
        }
    };
    
    static __compileIndex = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "collection", undefined, "key", undefined);
        return method(
        {
            dbgError: __dbgTerm(arg1.collection, "is not indexable"),
            collection: __compileTerm(arg0, arg1.collection),
            key: __compileTerm(arg0, arg1.key)
        }, __katspeak_expr_index_get__);
    };
    
    static __compileProperty = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "property", undefined);
        return method(
        {
            dbgError: __dbgTerm(arg1.property, "is not a function"),
            property: __compileTerm(arg0, arg1.property)
        }, __katspeak_expr_property_get__);
    };
    
    static __compileGlobal = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "name", is_string);
        var name = arg1.name;
        
        if (__exists(name))
        {
            var _callee = method(
            {
                value: __get(name)
            }, __katspeak_expr_value__);
            
            if (__isDynamicConstant(name))
            {
                return method(
                {
                    dbgError: __dbgTerm(arg1, "is not a function"),
                    callee: _callee,
                    shared: sharedData
                }, __katspeak_expr_call_0__);
            }
            else
            {
                return _callee;
            }
        }
        else
        {
            return method(
            {
                name: name,
                shared: sharedData
            }, __katspeak_expr_global_get__);
        }
    };
    
    static __compileLocal = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "idx", is_numeric);
        return method(
        {
            locals: arg0.locals,
            idx: arg1.idx
        }, __katspeak_expr_local_get__);
    };
    
    static __compileParams = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "key", is_struct);
        return method(
        {
            args: arg0.args,
            key: __compileTerm(arg0, arg1.key)
        }, __katspeak_expr_params_get__);
    };
    
    static __compileParamsCount = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1);
        return method(arg0, __katspeak_expr_params_count_get__);
    };
    
    static __compileFunctionExpr = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "idx", is_numeric);
        var funcExpr = __compileFunction(functions[arg1.idx]);
        __setupKatspeakFunctionMethods(funcExpr);
        return method(
        {
            value: funcExpr
        }, __katspeak_expr_value__);
    };
    
    static __compileSelf = function(arg0, arg1)
    {
        return method(sharedData, __katspeak_expr_self__);
    };
    
    static __compileTerm = function(arg0, arg1)
    {
        __katspeak_check_arg_struct("term", arg1, "type", is_numeric);
        var prod = __productionLookup[arg1.type];
        
        if (true && __katspeak_is_nullish(prod))
            __katspeak_error_bug();
        
        return prod(arg0, arg1);
    };
    
    static __productionLookup = (function()
    {
        var db = array_create(UnknownEnum.Value_27, undefined);
        db[UnknownEnum.Value_0] = __compileValue;
        db[UnknownEnum.Value_1] = __compileArray;
        db[UnknownEnum.Value_2] = __compileStruct;
        db[UnknownEnum.Value_3] = __compileBlock;
        db[UnknownEnum.Value_4] = __compileIf;
        db[UnknownEnum.Value_7] = __compileLoop;
        db[UnknownEnum.Value_8] = __compileWith;
        db[UnknownEnum.Value_9] = __compileMatch;
        db[UnknownEnum.Value_11] = __compileReturn;
        db[UnknownEnum.Value_12] = __compileBreak;
        db[UnknownEnum.Value_13] = __compileContinue;
        db[UnknownEnum.Value_14] = __compileOpBinary;
        db[UnknownEnum.Value_15] = __compileOpUnary;
        db[UnknownEnum.Value_16] = __compileCall;
        db[UnknownEnum.Value_17] = __compileCallNew;
        db[UnknownEnum.Value_18] = __compileSet;
        db[UnknownEnum.Value_19] = __compileIndex;
        db[UnknownEnum.Value_20] = __compileProperty;
        db[UnknownEnum.Value_22] = __compileGlobal;
        db[UnknownEnum.Value_21] = __compileLocal;
        db[UnknownEnum.Value_23] = __compileFunctionExpr;
        db[UnknownEnum.Value_26] = __compileSelf;
        db[UnknownEnum.Value_5] = __compileAnd;
        db[UnknownEnum.Value_6] = __compileOr;
        db[UnknownEnum.Value_24] = __compileParams;
        db[UnknownEnum.Value_25] = __compileParamsCount;
        return db;
    })();
    static __assignLookupIndex = (function()
    {
        var db = array_create(UnknownEnum.Value_5, undefined);
        db[UnknownEnum.Value_0] = __katspeak_expr_index_set__;
        db[UnknownEnum.Value_1] = __katspeak_expr_index_set_mult__;
        db[UnknownEnum.Value_2] = __katspeak_expr_index_set_div__;
        db[UnknownEnum.Value_3] = __katspeak_expr_index_set_sub__;
        db[UnknownEnum.Value_4] = __katspeak_expr_index_set_plus__;
        return db;
    })();
    static __assignLookupProperty = (function()
    {
        var db = array_create(UnknownEnum.Value_5, undefined);
        db[UnknownEnum.Value_0] = __katspeak_expr_property_set__;
        db[UnknownEnum.Value_1] = __katspeak_expr_property_set_mult__;
        db[UnknownEnum.Value_2] = __katspeak_expr_property_set_div__;
        db[UnknownEnum.Value_3] = __katspeak_expr_property_set_sub__;
        db[UnknownEnum.Value_4] = __katspeak_expr_property_set_plus__;
        return db;
    })();
    static __assignLookupLocal = (function()
    {
        var db = array_create(UnknownEnum.Value_5, undefined);
        db[UnknownEnum.Value_0] = __katspeak_expr_local_set__;
        db[UnknownEnum.Value_1] = __katspeak_expr_local_set_mult__;
        db[UnknownEnum.Value_2] = __katspeak_expr_local_set_div__;
        db[UnknownEnum.Value_3] = __katspeak_expr_local_set_sub__;
        db[UnknownEnum.Value_4] = __katspeak_expr_local_set_plus__;
        return db;
    })();
    static __assignLookupGlobal = (function()
    {
        var db = array_create(UnknownEnum.Value_5, undefined);
        db[UnknownEnum.Value_0] = __katspeak_expr_global_set__;
        db[UnknownEnum.Value_1] = __katspeak_expr_global_set_mult__;
        db[UnknownEnum.Value_2] = __katspeak_expr_global_set_div__;
        db[UnknownEnum.Value_3] = __katspeak_expr_global_set_sub__;
        db[UnknownEnum.Value_4] = __katspeak_expr_global_set_plus__;
        return db;
    })();
    
    static __dbgTerm = function(arg0, arg1 = "is invalid in this context")
    {
        __katspeak_check_arg_struct("term", arg0, "dbg", undefined);
        var terminalName = __katspeak_term_get_terminal(arg0);
        return "runtime error " + __katspeak_location_show_ext(arg0.dbg, __katspeak_is_nullish(terminalName) ? "value" : ("variable '" + terminalName + "'"), " ", arg1);
    };
    
    __katspeak_check_init();
    __katspeak_check_arg_struct("ir", arg0, "functions", is_array, "entryPoints", is_array);
    self.interface = arg1;
    self.functions = arg0.functions;
    self.sharedData = 
    {
        globals: {},
        self_: undefined
    };
    self.program = __compileFunctions(arg0.entryPoints);
    self.finalised = false;
}

function __katspeak_function__()
{
    var isRecursing = callTime >= 0;
    var localCount = array_length(locals);
    var oldLocals, oldArgsCount, oldArgs;
    
    if (isRecursing)
    {
        __katspeak_timeout_check(callTime);
        oldLocals = array_create(localCount);
        array_copy(oldLocals, 0, locals, 0, localCount);
        oldArgsCount = currentArgCount;
        oldArgs = array_create(oldArgsCount);
        array_copy(oldArgs, 0, args, 0, oldArgsCount);
        array_resize(args, argument_count);
    }
    else
    {
        callTime = current_time;
    }
    
    currentArgCount = argument_count;
    var argI = argCount - 1;
    
    while (argI >= 0)
    {
        locals[argI] = argument[argI];
        argI -= 1;
    }
    
    argI = argument_count - 1;
    
    while (argI >= 0)
    {
        args[argI] = argument[argI];
        argI -= 1;
    }
    
    var value;
    
    try
    {
        if (!is_numeric(program))
            value = program();
    }
    catch (e)
    {
        mods_katspeak_throw_error(e);
        
        if (e == global.__katspeakGmlReturnRef)
            value = e[0];
        else
            throw e;
    }
    finally
    {
        if (isRecursing)
        {
            array_copy(locals, 0, oldLocals, 0, localCount);
            currentArgCount = oldArgsCount;
            array_resize(args, currentArgCount);
            array_copy(args, 0, oldArgs, 0, currentArgCount);
        }
        else
        {
            callTime = -1;
            array_resize(locals, 0);
            array_resize(locals, localCount);
            array_resize(args, 0);
            array_resize(args, argCount);
        }
    }
    
    return value;
}

function __katspeak_expr_value__()
{
    return value;
}

function __katspeak_expr_array__()
{
    var i = 0;
    var values_ = values;
    var n_ = n;
    var arr = array_create(n_);
    
    repeat (n_)
    {
        var value = values_[i];
        arr[i] = value();
        i += 1;
    }
    
    return arr;
}

function __katspeak_expr_struct__()
{
    var obj = {};
    var i = 0;
    var values_ = values;
    var n_ = n;
    
    repeat (n_)
    {
        var key = values_[i + 0];
        var value = values_[i + 1];
        variable_struct_set(obj, key(), value());
        i += 2;
    }
    
    return obj;
}

function __katspeak_expr_block__()
{
    var i = 0;
    var stmts_ = stmts;
    var n_ = n;
    
    repeat (n_)
    {
        var expr = stmts_[i];
        expr();
        i += 1;
    }
    
    return result();
}

function __katspeak_expr_block_2__()
{
    _1st();
    return _2nd();
}

function __katspeak_expr_block_3__()
{
    _1st();
    _2nd();
    return _3rd();
}

function __katspeak_expr_block_4__()
{
    _1st();
    _2nd();
    _3rd();
    return _4th();
}

function __katspeak_expr_block_5__()
{
    _1st();
    _2nd();
    _3rd();
    _4th();
    return _5th();
}

function __katspeak_expr_if__()
{
    return condition() ? ifTrue() : undefined;
}

function __katspeak_expr_if_else__()
{
    return condition() ? ifTrue() : ifFalse();
}

function __katspeak_expr_and__()
{
    return eager() && lazy();
}

function __katspeak_expr_or__()
{
    return eager() || lazy();
}

function __katspeak_expr_loop_while__()
{
    var callTime = ctx.callTime;
    var condition_ = condition;
    var body_ = body;
    
    while (condition_())
    {
        __katspeak_timeout_check(callTime);
        
        try
        {
            body_();
        }
        catch (e)
        {
            mods_katspeak_throw_error(e);
            
            if (e == global.__katspeakGmlBreakRef)
                return e[0];
            else if (e != global.__katspeakGmlContinueRef)
                throw e;
        }
    }
    
    return undefined;
}

function __katspeak_expr_loop_for__()
{
    var callTime = ctx.callTime;
    var condition_ = condition;
    var step_ = step;
    var body_ = body;
    
    while (condition_())
    {
        __katspeak_timeout_check(callTime);
        
        try
        {
            body_();
        }
        catch (e)
        {
            mods_katspeak_throw_error(e);
            
            if (e == global.__katspeakGmlBreakRef)
                return e[0];
            else if (e != global.__katspeakGmlContinueRef)
                throw e;
        }
        
        step_();
    }
    
    return undefined;
}

function __katspeak_expr_loop_do__()
{
    var callTime = ctx.callTime;
    var condition_ = condition;
    var body_ = body;
    
    do
    {
        __katspeak_timeout_check(callTime);
        
        try
        {
            body_();
        }
        catch (e)
        {
            mods_katspeak_throw_error(e);
            
            if (e == global.__katspeakGmlBreakRef)
                return e[0];
            else if (e != global.__katspeakGmlContinueRef)
                throw e;
        }
    }
    until (!condition_());
    
    return undefined;
}

function __katspeak_expr_loop_general__()
{
    var callTime = ctx.callTime;
    var preCondition_ = preCondition;
    var postCondition_ = postCondition;
    var step_ = step;
    var body_ = body;
    
    while (true)
    {
        __katspeak_timeout_check(callTime);
        
        if (preCondition_ != undefined && !preCondition_())
            break;
        
        try
        {
            body_();
        }
        catch (e)
        {
            mods_katspeak_throw_error(e);
            
            if (e == global.__katspeakGmlBreakRef)
                return e[0];
            else if (e != global.__katspeakGmlContinueRef)
                throw e;
        }
        
        if (postCondition_ != undefined && !postCondition_())
            break;
        
        if (step_ != undefined)
            step_();
    }
    
    return undefined;
}

function __katspeak_expr_loop_with__()
{
    var body_ = body;
    
    with (scope())
    {
        var __selfPrev = global.__katspeakGmlSelf;
        var __otherPrev = global.__katspeakGmlOther;
        
        try
        {
            global.__katspeakGmlOther = __selfPrev;
            global.__katspeakGmlSelf = self;
            
            try
            {
                body_();
            }
            catch (e)
            {
                mods_katspeak_throw_error(e);
                
                if (e == global.__katspeakGmlBreakRef)
                    return e[0];
                else if (e != global.__katspeakGmlContinueRef)
                    throw e;
            }
        }
        finally
        {
            global.__katspeakGmlSelf = __selfPrev;
            global.__katspeakGmlOther = __otherPrev;
        }
    }
    
    return undefined;
}

function __katspeak_expr_match__()
{
    var value_ = value();
    var i = 0;
    var len = array_length(arms);
    
    repeat (len)
    {
        var arm = arms[i];
        
        if (__katspeak_is_nullish(arm.condition) || value_ == arm.condition())
            return arm.result();
        
        i += 1;
    }
    
    return undefined;
}

function __katspeak_expr_while_simple__()
{
    var callTime = ctx.callTime;
    var condition_ = condition;
    var body_ = body;
    
    while (condition_())
    {
        __katspeak_timeout_check(callTime);
        body_();
    }
    
    return undefined;
}

function __katspeak_expr_return__()
{
    var box = global.__katspeakGmlReturnRef;
    box[0] = value();
    throw box;
}

function __katspeak_expr_break__()
{
    var box = global.__katspeakGmlBreakRef;
    box[0] = value();
    throw box;
}

function __katspeak_expr_continue__()
{
    throw global.__katspeakGmlContinueRef;
}

function __katspeak_expr_op_1__()
{
    var value_ = value();
    return op(value_);
}

function __katspeak_expr_op_2__()
{
    var lhs_ = lhs();
    var rhs_ = rhs();
    return op(lhs_, rhs_);
}

function __katspeak_expr_call_method__()
{
    var collection_ = collection();
    var key_ = key();
    var callee_;
    
    if (is_array(collection_))
        callee_ = collection_[key_];
    else if (__katspeak_is_withable(collection_))
        callee_ = variable_struct_get(collection_, key_);
    else
        __katspeak_error_got(dbgError, collection_);
    
    if (!is_method(callee_))
        __katspeak_error_got(dbgError, callee_);
    
    var i = 0;
    var values_ = args;
    var n_ = array_length(values_);
    var args_ = array_create(n_);
    
    repeat (n_)
    {
        var value = values_[i];
        args_[i] = value();
        i += 1;
    }
    
    var shared_ = shared;
    
    with (method_get_self(callee_) ?? collection_)
    {
        var calleeIdx = method_get_index(callee_);
        return script_execute_ext(calleeIdx, args_);
    }
}

function __katspeak_expr_call__()
{
    var callee_ = callee();
    
    if (!is_method(callee_))
        __katspeak_error_got(dbgError, callee_);
    
    var i = 0;
    var values_ = args;
    var n_ = array_length(values_);
    var args_ = array_create(n_);
    
    repeat (n_)
    {
        var value = values_[i];
        args_[i] = value();
        i += 1;
    }
    
    var shared_ = shared;
    
    with (method_get_self(callee_) ?? (global.__katspeakGmlSelf ?? (shared_.self_ ?? shared_.globals)))
    {
        var calleeIdx = method_get_index(callee_);
        return script_execute_ext(calleeIdx, args_);
    }
}

function __katspeak_expr_call_0__()
{
    var callee_ = callee();
    
    if (!is_method(callee_))
        __katspeak_error_got(dbgError, callee_);
    
    var shared_ = shared;
    
    if (method_get_self(callee_) != undefined)
        return callee_();
    
    with (global.__katspeakGmlSelf ?? (shared_.self_ ?? shared_.globals))
    {
        var calleeIdx = method_get_index(callee_);
        return script_execute(calleeIdx);
    }
}

function __katspeak_expr_call_1__()
{
    var callee_ = callee();
    
    if (!is_method(callee_))
        __katspeak_error_got(dbgError, callee_);
    
    var values_ = args;
    var arg1 = values_[0]();
    var shared_ = shared;
    
    if (method_get_self(callee_) != undefined)
        return callee_(arg1);
    
    with (global.__katspeakGmlSelf ?? (shared_.self_ ?? shared_.globals))
    {
        var calleeIdx = method_get_index(callee_);
        return script_execute(calleeIdx, arg1);
    }
}

function __katspeak_expr_call_2__()
{
    var callee_ = callee();
    
    if (!is_method(callee_))
        __katspeak_error_got(dbgError, callee_);
    
    var values_ = args;
    var arg1 = values_[0]();
    var arg2 = values_[1]();
    var shared_ = shared;
    
    if (method_get_self(callee_) != undefined)
        return callee_(arg1, arg2);
    
    with (global.__katspeakGmlSelf ?? (shared_.self_ ?? shared_.globals))
    {
        var calleeIdx = method_get_index(callee_);
        return script_execute(calleeIdx, arg1, arg2);
    }
}

function __katspeak_expr_call_3__()
{
    var callee_ = callee();
    
    if (!is_method(callee_))
        __katspeak_error_got(dbgError, callee_);
    
    var values_ = args;
    var arg1 = values_[0]();
    var arg2 = values_[1]();
    var arg3 = values_[2]();
    var shared_ = shared;
    
    if (method_get_self(callee_) != undefined)
        return callee_(arg1, arg2, arg3);
    
    with (global.__katspeakGmlSelf ?? (shared_.self_ ?? shared_.globals))
    {
        var calleeIdx = method_get_index(callee_);
        return script_execute(calleeIdx, arg1, arg2, arg3);
    }
}

function __katspeak_expr_call_new__()
{
    var callee_ = callee();
    
    if (!is_method(callee_))
        __katspeak_error_got(dbgError, callee_);
    
    var args_ = args;
    
    switch (array_length(args_))
    {
        case 0:
            return new callee_();
        
        case 1:
            return new callee_(args_[0]());
        
        case 2:
            return new callee_(args_[0](), args_[1]());
        
        case 3:
            return new callee_(args_[0](), args_[1](), args_[2]());
        
        case 4:
            return new callee_(args_[0](), args_[1](), args_[2](), args_[3]());
        
        case 5:
            return new callee_(args_[0](), args_[1](), args_[2](), args_[3](), args_[4]());
        
        case 6:
            return new callee_(args_[0](), args_[1](), args_[2](), args_[3](), args_[4](), args_[5]());
        
        case 7:
            return new callee_(args_[0](), args_[1](), args_[2](), args_[3](), args_[4](), args_[5](), args_[6]());
        
        case 8:
            return new callee_(args_[0](), args_[1](), args_[2](), args_[3](), args_[4](), args_[5](), args_[6](), args_[7]());
        
        case 9:
            return new callee_(args_[0](), args_[1](), args_[2](), args_[3](), args_[4](), args_[5](), args_[6](), args_[7](), args_[8]());
        
        case 10:
            return new callee_(args_[0](), args_[1](), args_[2](), args_[3](), args_[4](), args_[5](), args_[6](), args_[7](), args_[8](), args_[9]());
        
        case 11:
            return new callee_(args_[0](), args_[1](), args_[2](), args_[3](), args_[4](), args_[5](), args_[6](), args_[7](), args_[8](), args_[9](), args_[10]());
        
        case 12:
            return new callee_(args_[0](), args_[1](), args_[2](), args_[3](), args_[4](), args_[5](), args_[6](), args_[7](), args_[8](), args_[9](), args_[10](), args_[11]());
        
        case 13:
            return new callee_(args_[0](), args_[1](), args_[2](), args_[3](), args_[4](), args_[5](), args_[6](), args_[7](), args_[8](), args_[9](), args_[10](), args_[11](), args_[12]());
        
        case 14:
            return new callee_(args_[0](), args_[1](), args_[2](), args_[3](), args_[4](), args_[5](), args_[6](), args_[7](), args_[8](), args_[9](), args_[10](), args_[11](), args_[12](), args_[13]());
        
        case 15:
            return new callee_(args_[0](), args_[1](), args_[2](), args_[3](), args_[4](), args_[5](), args_[6](), args_[7](), args_[8](), args_[9](), args_[10](), args_[11](), args_[12](), args_[13](), args_[14]());
        
        case 16:
            return new callee_(args_[0](), args_[1](), args_[2](), args_[3](), args_[4](), args_[5](), args_[6](), args_[7](), args_[8](), args_[9](), args_[10](), args_[11](), args_[12](), args_[13](), args_[14](), args_[15]());
        
        default:
            __katspeak_error_got("cannot exceed 16 arguments in 'new' expression");
    }
}

function __katspeak_expr_index_get__()
{
    var collection_ = collection();
    var key_ = key();
    
    if (is_array(collection_))
        return collection_[key_];
    else if (__katspeak_is_withable(collection_))
        return variable_struct_get(collection_, key_);
    else
        __katspeak_error_got(dbgError, collection_);
}

function __katspeak_expr_index_set__()
{
    var collection_ = collection();
    var key_ = key();
    var value_ = value();
    
    if (is_array(collection_))
        collection_[key_] = value_;
    else if (__katspeak_is_withable(collection_))
        variable_struct_set(collection_, key_, value_);
    else
        __katspeak_error_got(dbgError, collection_);
}

function __katspeak_expr_index_set_mult__()
{
    var collection_ = collection();
    var key_ = key();
    var value_ = value();
    
    if (is_array(collection_))
        collection_[key_] *= value_;
    else if (__katspeak_is_withable(collection_))
        variable_struct_set(collection_, key_, variable_struct_get(collection_, key_) * value_);
    else
        __katspeak_error_got(dbgError, collection_);
}

function __katspeak_expr_index_set_div__()
{
    var collection_ = collection();
    var key_ = key();
    var value_ = value();
    
    if (is_array(collection_))
        collection_[key_] /= value_;
    else if (__katspeak_is_withable(collection_))
        variable_struct_set(collection_, key_, variable_struct_get(collection_, key_) / value_);
    else
        __katspeak_error_got(dbgError, collection_);
}

function __katspeak_expr_index_set_sub__()
{
    var collection_ = collection();
    var key_ = key();
    var value_ = value();
    
    if (is_array(collection_))
        collection_[key_] -= value_;
    else if (__katspeak_is_withable(collection_))
        variable_struct_set(collection_, key_, variable_struct_get(collection_, key_) - value_);
    else
        __katspeak_error_got(dbgError, collection_);
}

function __katspeak_expr_index_set_plus__()
{
    var collection_ = collection();
    var key_ = key();
    var value_ = value();
    
    if (is_array(collection_))
        collection_[key_] += value_;
    else if (__katspeak_is_withable(collection_))
        variable_struct_set(collection_, key_, variable_struct_get(collection_, key_) + value_);
    else
        __katspeak_error_got(dbgError, collection_);
}

function __katspeak_expr_property_get__()
{
    var property_ = property();
    
    if (!is_method(property_))
        __katspeak_error_got(dbgError, property_);
    
    return property_();
}

function __katspeak_expr_property_set__()
{
    var property_ = property();
    var value_ = value();
    
    if (!is_method(property_))
        __katspeak_error_got(dbgError, property_);
    
    return property_(value_);
}

function __katspeak_expr_property_set_mult__()
{
    var property_ = property();
    var value_ = value();
    
    if (!is_method(property_))
        __katspeak_error_got(dbgError, property_);
    
    return property_(property_() * value_);
}

function __katspeak_expr_property_set_div__()
{
    var property_ = property();
    var value_ = value();
    
    if (!is_method(property_))
        __katspeak_error_got(dbgError, property_);
    
    return property_(property_() / value_);
}

function __katspeak_expr_property_set_sub__()
{
    var property_ = property();
    var value_ = value();
    
    if (!is_method(property_))
        __katspeak_error_got(dbgError, property_);
    
    return property_(property_() - value_);
}

function __katspeak_expr_property_set_plus__()
{
    var property_ = property();
    var value_ = value();
    
    if (!is_method(property_))
        __katspeak_error_got(dbgError, property_);
    
    return property_(property_() + value_);
}

function __katspeak_expr_global_get__()
{
    return variable_struct_get(shared.globals, name);
}

function __katspeak_expr_global_set__()
{
    variable_struct_set(shared.globals, name, value());
}

function __katspeak_expr_global_set_mult__()
{
    variable_struct_set(shared.globals, name, variable_struct_get(shared.globals, name) * value());
}

function __katspeak_expr_global_set_div__()
{
    variable_struct_set(shared.globals, name, variable_struct_get(shared.globals, name) / value());
}

function __katspeak_expr_global_set_sub__()
{
    variable_struct_set(shared.globals, name, variable_struct_get(shared.globals, name) - value());
}

function __katspeak_expr_global_set_plus__()
{
    variable_struct_set(shared.globals, name, variable_struct_get(shared.globals, name) + value());
}

function __katspeak_expr_local_get__()
{
    return locals[idx];
}

function __katspeak_expr_local_set__()
{
    locals[idx] = value();
}

function __katspeak_expr_local_set_mult__()
{
    locals[idx] *= value();
}

function __katspeak_expr_local_set_div__()
{
    locals[idx] /= value();
}

function __katspeak_expr_local_set_sub__()
{
    locals[idx] -= value();
}

function __katspeak_expr_local_set_plus__()
{
    locals[idx] += value();
}

function __katspeak_expr_self__()
{
    return global.__katspeakGmlSelf ?? (self_ ?? globals);
}

function __katspeak_expr_other__()
{
    return global.__katspeakGmlOther ?? globals;
}

function __katspeak_expr_params_get__()
{
    var key_ = key();
    return args[key_];
}

function __katspeak_expr_params_count_get__()
{
    return currentArgCount;
}

function __katspeak_init_codegen()
{
    global.__katspeakGmlReturnRef = [undefined];
    global.__katspeakGmlBreakRef = [undefined];
    global.__katspeakGmlContinueRef = [];
    global.__katspeakGmlSelf = undefined;
    global.__katspeakGmlOther = undefined;
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
    Value_26,
    Value_27
}
