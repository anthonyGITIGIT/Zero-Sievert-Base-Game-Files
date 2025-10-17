function __catspeak_timeout_check(arg0)
{
    if ((current_time - arg0) > 100000)
        __catspeak_error("process exceeded allowed time of ", 100000, " ms");
}

function __catspeak_is_withable(arg0)
{
    if (is_struct(arg0) || arg0 == self || arg0 == other)
        return true;
    
    var isInst = false;
    
    try
    {
        isInst = !object_exists(arg0) && instance_exists(arg0);
    }
    catch (_)
    {
    }
    
    return isInst;
}

function CatspeakGMLCompiler(arg0, arg1 = undefined) constructor
{
    static update = function()
    {
        if (false && finalised)
            __catspeak_error("attempting to update gml compiler after it has been finalised");
        
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
            exprs[i] = __compileFunction(functions_[entry]);
        }
        
        var rootCall = __emitBlock(exprs);
        __setupCatspeakFunctionMethods(rootCall);
        return rootCall;
    };
    
    static __setupCatspeakFunctionMethods = function(arg0)
    {
        arg0.sharedData = sharedData;
        arg0.pushSelf = method(sharedData, function(arg0)
        {
            array_push(selfStack, arg0);
            globals = catspeak_special_to_struct(arg0);
        });
        arg0.popSelf = method(sharedData, function()
        {
            if (array_length(selfStack) > 1)
                array_pop(selfStack);
            
            globals = catspeak_special_to_struct(selfStack[array_length(selfStack) - 1]);
        });
        arg0.setSelf = method(sharedData, function(arg0)
        {
            selfStack = [arg0];
            selfOriginal = arg0;
            globals = catspeak_special_to_struct(arg0);
        });
        arg0.resetSelf = method(sharedData, function()
        {
            globals = catspeak_special_to_struct(selfOriginal);
        });
        arg0.setGlobals = method(sharedData, function(arg0)
        {
            self_ = catspeak_special_to_struct(arg0);
        });
        arg0.getSelf = method(sharedData, function()
        {
            return globals ?? self_;
        });
        arg0.getGlobals = method(sharedData, function()
        {
            return self_;
        });
    };
    
    static __compileFunction = function(arg0)
    {
        var ctx = 
        {
            callTime: -1,
            program: undefined,
            locals: array_create(arg0.localCount),
            argCount: arg0.argCount
        };
        ctx.program = __compileTerm(ctx, arg0.root);
        
        if (__catspeak_term_is_pure(arg0.root.type))
            return ctx.program;
        
        var _method = method(ctx, __catspeak_function__);
        ctx.boundFunc = _method;
        return _method;
    };
    
    static __compileValue = function(arg0, arg1)
    {
        return method(
        {
            value: arg1.value
        }, __catspeak_expr_value__);
    };
    
    static __compileArray = function(arg0, arg1)
    {
        var values = arg1.values;
        var valueCount = array_length(values);
        var exprs = array_create(valueCount);
        
        for (var i = 0; i < valueCount; i += 1)
            exprs[i] = __compileTerm(arg0, values[i]);
        
        return method(
        {
            values: exprs,
            n: array_length(exprs)
        }, __catspeak_expr_array__);
    };
    
    static __compileStruct = function(arg0, arg1)
    {
        var values = arg1.values;
        var valueCount = array_length(values);
        var exprs = array_create(valueCount);
        
        for (var i = 0; i < valueCount; i += 1)
            exprs[i] = __compileTerm(arg0, values[i]);
        
        return method(
        {
            values: exprs,
            n: array_length(exprs) div 2
        }, __catspeak_expr_struct__);
    };
    
    static __compileBlock = function(arg0, arg1)
    {
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
            }, __catspeak_expr_block_2__);
        }
        else if (exprCount == 3)
        {
            return method(
            {
                _1st: arg0[0],
                _2nd: arg0[1],
                _3rd: arg0[2]
            }, __catspeak_expr_block_3__);
        }
        else if (exprCount == 4)
        {
            return method(
            {
                _1st: arg0[0],
                _2nd: arg0[1],
                _3rd: arg0[2],
                _4th: arg0[3]
            }, __catspeak_expr_block_4__);
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
            }, __catspeak_expr_block_5__);
        }
        
        return method(
        {
            stmts: arg0,
            n: exprCount - 1,
            result: arg0[exprCount - 1]
        }, __catspeak_expr_block__);
    };
    
    static __compileIf = function(arg0, arg1)
    {
        if (arg1.ifFalse == undefined)
        {
            return method(
            {
                condition: __compileTerm(arg0, arg1.condition),
                ifTrue: __compileTerm(arg0, arg1.ifTrue)
            }, __catspeak_expr_if__);
        }
        else
        {
            return method(
            {
                condition: __compileTerm(arg0, arg1.condition),
                ifTrue: __compileTerm(arg0, arg1.ifTrue),
                ifFalse: __compileTerm(arg0, arg1.ifFalse)
            }, __catspeak_expr_if_else__);
        }
    };
    
    static __compileWhile = function(arg0, arg1)
    {
        return method(
        {
            ctx: arg0,
            condition: __compileTerm(arg0, arg1.condition),
            body: __compileTerm(arg0, arg1.body)
        }, __catspeak_expr_while__);
    };
    
    static __compileUse = function(arg0, arg1)
    {
        return method(
        {
            dbgError: __dbgTerm(arg1.condition, "is not a function"),
            condition: __compileTerm(arg0, arg1.condition),
            body: __compileTerm(arg0, arg1.body)
        }, __catspeak_expr_use__);
    };
    
    static __compileReturn = function(arg0, arg1)
    {
        return method(
        {
            value: __compileTerm(arg0, arg1.value)
        }, __catspeak_expr_return__);
    };
    
    static __compileBreak = function(arg0, arg1)
    {
        return method(
        {
            value: __compileTerm(arg0, arg1.value)
        }, __catspeak_expr_break__);
    };
    
    static __compileContinue = function(arg0, arg1)
    {
        return method(undefined, __catspeak_expr_continue__);
    };
    
    static __compileOpUnary = function(arg0, arg1)
    {
        return method(
        {
            op: __catspeak_operator_get_unary(arg1.operator),
            value: __compileTerm(arg0, arg1.value)
        }, __catspeak_expr_op_1__);
    };
    
    static __compileOpBinary = function(arg0, arg1)
    {
        return method(
        {
            op: __catspeak_operator_get_binary(arg1.operator),
            lhs: __compileTerm(arg0, arg1.lhs),
            rhs: __compileTerm(arg0, arg1.rhs)
        }, __catspeak_expr_op_2__);
    };
    
    static __compileAnd = function(arg0, arg1)
    {
        return method(
        {
            eager: __compileTerm(arg0, arg1.eager),
            lazy: __compileTerm(arg0, arg1.lazy)
        }, __catspeak_expr_and__);
    };
    
    static __compileOr = function(arg0, arg1)
    {
        return method(
        {
            eager: __compileTerm(arg0, arg1.eager),
            lazy: __compileTerm(arg0, arg1.lazy)
        }, __catspeak_expr_or__);
    };
    
    static __compileCall = function(arg0, arg1)
    {
        var args = arg1.args;
        var argCount = array_length(args);
        var exprs = array_create(argCount);
        
        for (var i = 0; i < argCount; i += 1)
            exprs[i] = __compileTerm(arg0, args[i]);
        
        if (arg1.callee.type == UnknownEnum.Value_16)
        {
            var collection = __compileTerm(arg0, arg1.callee.collection);
            var key = __compileTerm(arg0, arg1.callee.key);
            return method(
            {
                dbgError: __dbgTerm(arg1.callee, "is not a function"),
                collection: collection,
                key: key,
                args: exprs,
                shared: sharedData
            }, __catspeak_expr_call_method__);
        }
        else
        {
            var callee = __compileTerm(arg0, arg1.callee);
            return method(
            {
                dbgError: __dbgTerm(arg1.callee, "is not a function"),
                callee: callee,
                args: exprs,
                shared: sharedData
            }, __catspeak_expr_call__);
        }
    };
    
    static __compileSet = function(arg0, arg1)
    {
        var target = arg1.target;
        var targetType = target.type;
        var value = __compileTerm(arg0, arg1.value);
        
        if (targetType == UnknownEnum.Value_16)
        {
            var func = __assignLookupIndex[arg1.assignType];
            return method(
            {
                dbgError: __dbgTerm(target.collection, "is not indexable"),
                collection: __compileTerm(arg0, target.collection),
                key: __compileTerm(arg0, target.key),
                value: value
            }, func);
        }
        else if (targetType == UnknownEnum.Value_17)
        {
            var func = __assignLookupProperty[arg1.assignType];
            return method(
            {
                dbgError: __dbgTerm(target.property, "is not a function"),
                property: __compileTerm(arg0, target.property),
                value: value
            }, func);
        }
        else if (targetType == UnknownEnum.Value_18)
        {
            var func = __assignLookupLocal[arg1.assignType];
            return method(
            {
                locals: arg0.locals,
                idx: target.idx,
                value: value
            }, func);
        }
        else if (targetType == UnknownEnum.Value_19)
        {
            var name = target.name;
            
            if (variable_struct_exists(interface, name))
                __catspeak_error(__catspeak_location_show(target.dbg), " -- invalid assignment target, ", "cannot assign to built-in function or constant");
            
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
            __catspeak_error(__catspeak_location_show(target.dbg), " -- invalid assignment target, ", "must be an identifier or accessor expression");
        }
    };
    
    static __compileIndex = function(arg0, arg1)
    {
        return method(
        {
            dbgError: __dbgTerm(arg1.collection, "is not indexable"),
            collection: __compileTerm(arg0, arg1.collection),
            key: __compileTerm(arg0, arg1.key)
        }, __catspeak_expr_index_get__);
    };
    
    static __compileProperty = function(arg0, arg1)
    {
        return method(
        {
            dbgError: __dbgTerm(arg1.property, "is not a function"),
            property: __compileTerm(arg0, arg1.property)
        }, __catspeak_expr_property_get__);
    };
    
    static __compileGlobal = function(arg0, arg1)
    {
        var name = arg1.name;
        
        if (variable_struct_exists(interface, name))
        {
            return method(
            {
                value: variable_struct_get(interface, name)
            }, __catspeak_expr_value__);
        }
        else
        {
            return method(
            {
                name: name,
                shared: sharedData
            }, __catspeak_expr_global_get__);
        }
    };
    
    static __compileLocal = function(arg0, arg1)
    {
        return method(
        {
            locals: arg0.locals,
            idx: arg1.idx
        }, __catspeak_expr_local_get__);
    };
    
    static __compileFunctionExpr = function(arg0, arg1)
    {
        var funcExpr = __compileFunction(functions[arg1.idx]);
        __setupCatspeakFunctionMethods(funcExpr);
        return method(
        {
            value: funcExpr
        }, __catspeak_expr_value__);
    };
    
    static __compileSelf = function(arg0, arg1)
    {
        return method(sharedData, __catspeak_expr_self__);
    };
    
    static __compileTerm = function(arg0, arg1)
    {
        var prod = __productionLookup[arg1.type];
        
        if (false && prod == undefined)
            __catspeak_error_bug();
        
        return prod(arg0, arg1);
    };
    
    static __productionLookup = (function()
    {
        var db = array_create(UnknownEnum.Value_22, undefined);
        db[UnknownEnum.Value_0] = __compileValue;
        db[UnknownEnum.Value_1] = __compileArray;
        db[UnknownEnum.Value_2] = __compileStruct;
        db[UnknownEnum.Value_3] = __compileBlock;
        db[UnknownEnum.Value_4] = __compileIf;
        db[UnknownEnum.Value_7] = __compileWhile;
        db[UnknownEnum.Value_8] = __compileUse;
        db[UnknownEnum.Value_9] = __compileReturn;
        db[UnknownEnum.Value_10] = __compileBreak;
        db[UnknownEnum.Value_11] = __compileContinue;
        db[UnknownEnum.Value_12] = __compileOpBinary;
        db[UnknownEnum.Value_13] = __compileOpUnary;
        db[UnknownEnum.Value_14] = __compileCall;
        db[UnknownEnum.Value_15] = __compileSet;
        db[UnknownEnum.Value_16] = __compileIndex;
        db[UnknownEnum.Value_17] = __compileProperty;
        db[UnknownEnum.Value_19] = __compileGlobal;
        db[UnknownEnum.Value_18] = __compileLocal;
        db[UnknownEnum.Value_20] = __compileFunctionExpr;
        db[UnknownEnum.Value_21] = __compileSelf;
        db[UnknownEnum.Value_5] = __compileAnd;
        db[UnknownEnum.Value_6] = __compileOr;
        return db;
    })();
    static __assignLookupIndex = (function()
    {
        var db = array_create(UnknownEnum.Value_5, undefined);
        db[UnknownEnum.Value_0] = __catspeak_expr_index_set__;
        db[UnknownEnum.Value_1] = __catspeak_expr_index_set_mult__;
        db[UnknownEnum.Value_2] = __catspeak_expr_index_set_div__;
        db[UnknownEnum.Value_3] = __catspeak_expr_index_set_sub__;
        db[UnknownEnum.Value_4] = __catspeak_expr_index_set_plus__;
        return db;
    })();
    static __assignLookupProperty = (function()
    {
        var db = array_create(UnknownEnum.Value_5, undefined);
        db[UnknownEnum.Value_0] = __catspeak_expr_property_set__;
        db[UnknownEnum.Value_1] = __catspeak_expr_property_set_mult__;
        db[UnknownEnum.Value_2] = __catspeak_expr_property_set_div__;
        db[UnknownEnum.Value_3] = __catspeak_expr_property_set_sub__;
        db[UnknownEnum.Value_4] = __catspeak_expr_property_set_plus__;
        return db;
    })();
    static __assignLookupLocal = (function()
    {
        var db = array_create(UnknownEnum.Value_5, undefined);
        db[UnknownEnum.Value_0] = __catspeak_expr_local_set__;
        db[UnknownEnum.Value_1] = __catspeak_expr_local_set_mult__;
        db[UnknownEnum.Value_2] = __catspeak_expr_local_set_div__;
        db[UnknownEnum.Value_3] = __catspeak_expr_local_set_sub__;
        db[UnknownEnum.Value_4] = __catspeak_expr_local_set_plus__;
        return db;
    })();
    static __assignLookupGlobal = (function()
    {
        var db = array_create(UnknownEnum.Value_5, undefined);
        db[UnknownEnum.Value_0] = __catspeak_expr_global_set__;
        db[UnknownEnum.Value_1] = __catspeak_expr_global_set_mult__;
        db[UnknownEnum.Value_2] = __catspeak_expr_global_set_div__;
        db[UnknownEnum.Value_3] = __catspeak_expr_global_set_sub__;
        db[UnknownEnum.Value_4] = __catspeak_expr_global_set_plus__;
        return db;
    })();
    
    static __dbgTerm = function(arg0, arg1 = "is invalid in this context")
    {
        var terminalName = __catspeak_term_get_terminal(arg0);
        return "runtime error " + __catspeak_location_show_ext(arg0.dbg, (terminalName == undefined) ? "value" : ("variable '" + terminalName + "'"), " ", arg1);
    };
    
    self.interface = arg1 ?? {};
    self.functions = arg0.functions;
    self.sharedData = 
    {
        globals: undefined,
        self_: {},
        selfStack: [undefined]
    };
    self.program = __compileFunctions(arg0.entryPoints);
    self.finalised = false;
    self.sharedData.selfOriginal = self.sharedData.globals;
}

function __catspeak_function__()
{
    var _oldFunction = global.__catspeakCurrentFunction;
    global.__catspeakCurrentFunction = boundFunc;
    var isRecursing = callTime >= 0;
    var oldLocals, localCount;
    
    if (isRecursing)
    {
        __catspeak_timeout_check(callTime);
        localCount = array_length(locals);
        oldLocals = array_create(localCount);
        array_copy(oldLocals, 0, locals, 0, localCount);
    }
    else
    {
        callTime = current_time;
    }
    
    var argI = argCount - 1;
    
    while (argI >= 0)
    {
        locals[argI] = argument[argI];
        argI -= 1;
    }
    
    var value;
    
    try
    {
        value = program();
    }
    catch (e)
    {
        if (e == global.__catspeakGmlReturnRef)
        {
            value = e[0];
        }
        else
        {
            boundFunc.resetSelf();
            throw e;
        }
    }
    finally
    {
        if (isRecursing)
            array_copy(locals, 0, oldLocals, 0, localCount);
        else
            callTime = -1;
    }
    
    global.__catspeakCurrentFunction = _oldFunction;
    return value;
}

function __catspeak_expr_value__()
{
    return value;
}

function __catspeak_expr_array__()
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

function __catspeak_expr_struct__()
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

function __catspeak_expr_block__()
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

function __catspeak_expr_block_2__()
{
    _1st();
    return _2nd();
}

function __catspeak_expr_block_3__()
{
    _1st();
    _2nd();
    return _3rd();
}

function __catspeak_expr_block_4__()
{
    _1st();
    _2nd();
    _3rd();
    return _4th();
}

function __catspeak_expr_block_5__()
{
    _1st();
    _2nd();
    _3rd();
    _4th();
    return _5th();
}

function __catspeak_expr_if__()
{
    return condition() ? ifTrue() : undefined;
}

function __catspeak_expr_if_else__()
{
    return condition() ? ifTrue() : ifFalse();
}

function __catspeak_expr_and__()
{
    return eager() && lazy();
}

function __catspeak_expr_or__()
{
    return eager() || lazy();
}

function __catspeak_expr_while__()
{
    var callTime = ctx.callTime;
    var condition_ = condition;
    var body_ = body;
    
    while (condition_())
    {
        __catspeak_timeout_check(callTime);
        
        try
        {
            body_();
        }
        catch (e)
        {
            if (e == global.__catspeakGmlBreakRef)
                return e[0];
            else if (e != global.__catspeakGmlContinueRef)
                throw e;
        }
    }
}

function __catspeak_expr_use__()
{
    var body_ = body;
    var open = condition();
    
    if (!is_method(open) && (!is_numeric(open) || !script_exists(open)))
        __catspeak_error_got(dbgError, open);
    
    var close = open();
    
    if (!is_method(close) && (!is_numeric(close) || !script_exists(close)))
        __catspeak_error_got(dbgError, close);
    
    var result;
    
    try
    {
        body_();
    }
    catch (_e)
    {
        show_debug_message(_e);
    }
    finally
    {
        result = close();
    }
    
    return result;
}

function __catspeak_expr_while_simple__()
{
    var callTime = ctx.callTime;
    var condition_ = condition;
    var body_ = body;
    
    while (condition_())
    {
        __catspeak_timeout_check(callTime);
        body_();
    }
}

function __catspeak_expr_return__()
{
    var box = global.__catspeakGmlReturnRef;
    box[0] = value();
    throw box;
}

function __catspeak_expr_break__()
{
    var box = global.__catspeakGmlBreakRef;
    box[0] = value();
    throw box;
}

function __catspeak_expr_continue__()
{
    throw global.__catspeakGmlContinueRef;
}

function __catspeak_expr_op_1__()
{
    var value_ = value();
    return op(value_);
}

function __catspeak_expr_op_2__()
{
    var lhs_ = lhs();
    var rhs_ = rhs();
    return op(lhs_, rhs_);
}

function __catspeak_expr_call_method__()
{
    var collection_ = collection();
    var key_ = key();
    var callee_;
    
    if (is_array(collection_))
        callee_ = collection_[key_];
    else if (__catspeak_is_withable(collection_))
        callee_ = variable_struct_get(collection_, key_);
    else
        __catspeak_error_got(dbgError, collection_);
    
    if (!is_method(callee_))
        __catspeak_error_got(dbgError, callee_);
    
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

function __catspeak_expr_call__()
{
    var callee_ = callee();
    
    if (!is_method(callee_))
        __catspeak_error_got(dbgError, callee_);
    
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
    var methodSelf_ = method_get_self(callee_);
    var fallback_ = shared_.globals ?? shared_.self_;
    
    with (methodSelf_ ?? fallback_)
    {
        var calleeIdx = method_get_index(callee_);
        return script_execute_ext(calleeIdx, args_);
    }
}

function __catspeak_expr_index_get__()
{
    var collection_ = collection();
    var key_ = key();
    
    if (is_array(collection_))
    {
        return collection_[key_];
    }
    else if (is_struct(collection_))
    {
        if (variable_struct_exists(collection_, "Get"))
            return collection_.Get(key_);
        else
            return variable_struct_get(collection_, key_);
    }
    else
    {
        __catspeak_error_got(dbgError, collection_);
    }
}

function __catspeak_expr_index_set__()
{
    var collection_ = collection();
    var key_ = key();
    var value_ = value();
    
    if (is_array(collection_))
    {
        collection_[key_] = value_;
    }
    else if (is_struct(collection_))
    {
        if (variable_struct_exists(collection_, "Set"))
            collection_.Set(key_, value_);
        else
            variable_struct_set(collection_, key_, value_);
    }
    else
    {
        __catspeak_error_got(dbgError, collection_);
    }
}

function __catspeak_expr_index_set_mult__()
{
    var collection_ = collection();
    var key_ = key();
    var value_ = value();
    
    if (is_array(collection_))
    {
        collection_[key_] *= value_;
    }
    else if (is_struct(collection_))
    {
        if (variable_struct_exists(collection_, "Get"))
        {
            if (variable_struct_exists(collection_, "Set"))
                collection_.Set(key_, collection_.Get(key_) * value_);
            else
                variable_struct_set(collection_, key_, collection_.Get(key_) * value_);
        }
        else if (variable_struct_exists(collection_, "Set"))
        {
            collection_.Set(key_, variable_struct_get(collection_, key_) * value_);
        }
        else
        {
            variable_struct_set(collection_, key_, variable_struct_get(collection_, key_) * value_);
        }
    }
    else
    {
        __catspeak_error_got(dbgError, collection_);
    }
}

function __catspeak_expr_index_set_div__()
{
    var collection_ = collection();
    var key_ = key();
    var value_ = value();
    
    if (is_array(collection_))
    {
        collection_[key_] /= value_;
    }
    else if (is_struct(collection_))
    {
        if (variable_struct_exists(collection_, "Get"))
        {
            if (variable_struct_exists(collection_, "Set"))
                collection_.Set(key_, collection_.Get(key_) / value_);
            else
                variable_struct_set(collection_, key_, collection_.Get(key_) / value_);
        }
        else if (variable_struct_exists(collection_, "Set"))
        {
            collection_.Set(key_, variable_struct_get(collection_, key_) / value_);
        }
        else
        {
            variable_struct_set(collection_, key_, variable_struct_get(collection_, key_) / value_);
        }
    }
    else
    {
        __catspeak_error_got(dbgError, collection_);
    }
}

function __catspeak_expr_index_set_sub__()
{
    var collection_ = collection();
    var key_ = key();
    var value_ = value();
    
    if (is_array(collection_))
    {
        collection_[key_] -= value_;
    }
    else if (is_struct(collection_))
    {
        if (variable_struct_exists(collection_, "Get"))
        {
            if (variable_struct_exists(collection_, "Set"))
                collection_.Set(key_, collection_.Get(key_) - value_);
            else
                variable_struct_set(collection_, key_, collection_.Get(key_) - value_);
        }
        else if (variable_struct_exists(collection_, "Set"))
        {
            collection_.Set(key_, variable_struct_get(collection_, key_) - value_);
        }
        else
        {
            variable_struct_set(collection_, key_, variable_struct_get(collection_, key_) - value_);
        }
    }
    else
    {
        __catspeak_error_got(dbgError, collection_);
    }
}

function __catspeak_expr_index_set_plus__()
{
    var collection_ = collection();
    var key_ = key();
    var value_ = value();
    
    if (is_array(collection_))
    {
        collection_[key_] += value_;
    }
    else if (is_struct(collection_))
    {
        if (variable_struct_exists(collection_, "Get"))
        {
            if (variable_struct_exists(collection_, "Set"))
                collection_.Set(key_, collection_.Get(key_) + value_);
            else
                variable_struct_set(collection_, key_, collection_.Get(key_) + value_);
        }
        else if (variable_struct_exists(collection_, "Set"))
        {
            collection_.Set(key_, variable_struct_get(collection_, key_) + value_);
        }
        else
        {
            variable_struct_set(collection_, key_, variable_struct_get(collection_, key_) + value_);
        }
    }
    else
    {
        __catspeak_error_got(dbgError, collection_);
    }
}

function __catspeak_expr_property_get__()
{
    var property_ = property();
    
    if (!is_method(property_))
        __catspeak_error_got(dbgError, property_);
    
    return property_();
}

function __catspeak_expr_property_set__()
{
    var property_ = property();
    var value_ = value();
    
    if (!is_method(property_))
        __catspeak_error_got(dbgError, property_);
    
    return property_(value_);
}

function __catspeak_expr_property_set_mult__()
{
    var property_ = property();
    var value_ = value();
    
    if (!is_method(property_))
        __catspeak_error_got(dbgError, property_);
    
    return property_(property_() * value_);
}

function __catspeak_expr_property_set_div__()
{
    var property_ = property();
    var value_ = value();
    
    if (!is_method(property_))
        __catspeak_error_got(dbgError, property_);
    
    return property_(property_() / value_);
}

function __catspeak_expr_property_set_sub__()
{
    var property_ = property();
    var value_ = value();
    
    if (!is_method(property_))
        __catspeak_error_got(dbgError, property_);
    
    return property_(property_() - value_);
}

function __catspeak_expr_property_set_plus__()
{
    var property_ = property();
    var value_ = value();
    
    if (!is_method(property_))
        __catspeak_error_got(dbgError, property_);
    
    return property_(property_() + value_);
}

function __catspeak_expr_global_get__()
{
    var target = shared.globals;
    
    if (variable_struct_exists(target, "Get"))
        return target.Get(name);
    else
        return variable_struct_get(target, name);
}

function __catspeak_expr_global_set__()
{
    var target = shared.globals;
    
    if (variable_struct_exists(target, "Set"))
        return target.Set(name, value());
    else
        return variable_struct_get(target, name) == value();
}

function __catspeak_expr_global_set_mult__()
{
    var target = shared.globals;
    
    if (variable_struct_exists(target, "Get"))
    {
        if (variable_struct_exists(target, "Set"))
            target.Set(name, target.Get(name) * value());
        else
            variable_struct_set(target, name, target.Get(name) * value());
    }
    else if (variable_struct_exists(target, "Set"))
    {
        target.Set(name, variable_struct_get(target, name) * value());
    }
    else
    {
        variable_struct_set(target, name, variable_struct_get(target, name) * value());
    }
}

function __catspeak_expr_global_set_div__()
{
    var target = shared.globals;
    
    if (variable_struct_exists(target, "Get"))
    {
        if (variable_struct_exists(target, "Set"))
            target.Set(name, target.Get(name) / value());
        else
            variable_struct_set(target, name, target.Get(name) / value());
    }
    else if (variable_struct_exists(target, "Set"))
    {
        target.Set(name, variable_struct_get(target, name) / value());
    }
    else
    {
        variable_struct_set(target, name, variable_struct_get(target, name) / value());
    }
}

function __catspeak_expr_global_set_sub__()
{
    var target = shared.globals;
    
    if (variable_struct_exists(target, "Get"))
    {
        if (variable_struct_exists(target, "Set"))
            target.Set(name, target.Get(name) - value());
        else
            variable_struct_set(target, name, target.Get(name) - value());
    }
    else if (variable_struct_exists(target, "Set"))
    {
        target.Set(name, variable_struct_get(target, name) - value());
    }
    else
    {
        variable_struct_set(target, name, variable_struct_get(target, name) - value());
    }
}

function __catspeak_expr_global_set_plus__()
{
    var target = shared.globals;
    
    if (variable_struct_exists(target, "Get"))
    {
        if (variable_struct_exists(target, "Set"))
            target.Set(name, target.Get(name) + value());
        else
            variable_struct_set(target, name, target.Get(name) + value());
    }
    else if (variable_struct_exists(target, "Set"))
    {
        target.Set(name, variable_struct_get(target, name) + value());
    }
    else
    {
        variable_struct_set(target, name, variable_struct_get(target, name) + value());
    }
}

function __catspeak_expr_local_get__()
{
    return locals[idx];
}

function __catspeak_expr_local_set__()
{
    locals[idx] = value();
}

function __catspeak_expr_local_set_mult__()
{
    locals[idx] *= value();
}

function __catspeak_expr_local_set_div__()
{
    locals[idx] /= value();
}

function __catspeak_expr_local_set_sub__()
{
    locals[idx] -= value();
}

function __catspeak_expr_local_set_plus__()
{
    locals[idx] += value();
}

function __catspeak_expr_self__()
{
    return globals;
}

function __catspeak_init_codegen()
{
    global.__catspeakGmlReturnRef = [undefined];
    global.__catspeakGmlBreakRef = [undefined];
    global.__catspeakGmlContinueRef = [];
    global.__catspeakCurrentFunction = undefined;
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
    Value_22
}
