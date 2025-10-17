function __catspeak_deprecated(arg0, arg1 = undefined)
{
    if (arg1 == undefined)
        __catspeak_error_silent("'", arg0, "' isn't supported anymore");
    else
        __catspeak_error_silent("'", arg0, "' isn't supported anymore", ", use '", arg1, "' instead");
}

function catspeak_config()
{
    catspeak_force_init();
    var config = global.__catspeakConfig;
    
    if (argument_count > 0 && is_struct(argument[0]))
    {
        var newConfig = argument[0];
        var keys = variable_struct_get_names(newConfig);
        var i = array_length(keys) - 1;
        
        while (i > 0)
        {
            var key = keys[i];
            
            if (variable_struct_exists(config, key))
                variable_struct_set(config, key, variable_struct_get(newConfig, key));
            
            i -= 1;
        }
    }
    
    return config;
}

function catspeak_add_function()
{
    __catspeak_deprecated("catspeak_add_function", "Catspeak.addFunction");
    catspeak_force_init();
    
    for (var i = 0; i < argument_count; i += 2)
        global.Catspeak.addFunction(argument[i + 0], argument[i + 1]);
}

function catspeak_add_constant()
{
    __catspeak_deprecated("catspeak_add_function", "Catspeak.addConstant");
    catspeak_force_init();
    
    for (var i = 0; i < argument_count; i += 2)
        global.Catspeak.addConstant(argument[i + 0], argument[i + 1]);
}

function catspeak_execute(arg0, arg1)
{
    static noArgs = [];
    
    __catspeak_deprecated("catspeak_execute");
    var args_ = arg1 ?? noArgs;
    var argo = 0;
    var argc = array_length(args_);
    
    try
    {
        var result;
        
        with (method_get_self(arg0) ?? self)
            result = script_execute_ext(method_get_index(arg0), args_, argo, argc);
        
        return future_ok(result);
    }
    catch (e)
    {
        return future_error(e);
    }
}

function catspeak_session_extern(arg0)
{
    __catspeak_deprecated("catspeak_session_extern");
    return catspeak_into_gml_function(arg0);
}

function catspeak_into_gml_function(arg0)
{
    __catspeak_deprecated("catspeak_into_gml_function");
    return arg0;
}

function catspeak_compile_buffer(arg0, arg1 = false, arg2 = 0, arg3 = undefined)
{
    __catspeak_deprecated("catspeak_compile_buffer", "Catspeak.parse");
    var ret;
    
    try
    {
        var f = global.Catspeak.compileGML(global.Catspeak.parse(arg0, arg2, arg3));
        ret = future_ok(f);
    }
    catch (e)
    {
        ret = future_error(e);
    }
    finally
    {
        if (arg1)
            buffer_delete(arg0);
    }
    
    return ret;
}

function catspeak_compile_string(arg0)
{
    __catspeak_deprecated("catspeak_compile_buffer", "Catspeak.parseString");
    
    try
    {
        var f = global.Catspeak.compileGML(global.Catspeak.parseString(arg0));
        return future_ok(f);
    }
    catch (e)
    {
        return future_error(e);
    }
}

function catspeak_create_buffer_from_string(arg0)
{
    __catspeak_deprecated("catspeak_create_buffer_from_string");
    var capacity = string_byte_length(arg0);
    var buff = buffer_create(capacity, buffer_fixed, 1);
    buffer_write(buff, buffer_text, arg0);
    buffer_seek(buff, buffer_seek_start, 0);
    return buff;
}

function Future() constructor
{
    static accept = function(arg0)
    {
        __resolve(UnknownEnum.Value_1, arg0);
        var thenCount = array_length(thenFuncs);
        
        for (var i = 0; i < thenCount; i += 2)
        {
            var callback = thenFuncs[i + 0];
            var nextFuture = thenFuncs[i + 1];
            var result = callback(arg0);
            
            if (is_future(result))
            {
                result.andFinally(method(nextFuture, function(arg0)
                {
                    if (arg0.state == UnknownEnum.Value_1)
                        accept(arg0.result);
                    else
                        reject(arg0.result);
                }));
            }
            else
            {
                nextFuture.accept(result);
            }
        }
        
        var catchCount = array_length(catchFuncs);
        
        for (var i = 0; i < catchCount; i += 2)
        {
            var nextFuture = catchFuncs[i + 1];
            nextFuture.accept(arg0);
        }
        
        var finallyCount = array_length(finallyFuncs);
        
        for (var i = 0; i < finallyCount; i += 2)
        {
            var callback = finallyFuncs[i + 0];
            var nextFuture = finallyFuncs[i + 1];
            callback(self);
            nextFuture.accept(arg0);
        }
    };
    
    static reject = function(arg0)
    {
        __resolve(UnknownEnum.Value_2, arg0);
        var thenCount = array_length(thenFuncs);
        
        for (var i = 0; i < thenCount; i += 2)
        {
            var nextFuture = thenFuncs[i + 1];
            nextFuture.reject(arg0);
        }
        
        var catchCount = array_length(catchFuncs);
        
        for (var i = 0; i < catchCount; i += 2)
        {
            var callback = catchFuncs[i + 0];
            var nextFuture = catchFuncs[i + 1];
            var result = callback(arg0);
            
            if (is_future(result))
            {
                result.andFinally(method(nextFuture, function(arg0)
                {
                    if (arg0.state == UnknownEnum.Value_1)
                        accept(arg0.result);
                    else
                        reject(arg0.result);
                }));
            }
            else
            {
                nextFuture.accept(result);
            }
        }
        
        var finallyCount = array_length(finallyFuncs);
        
        for (var i = 0; i < finallyCount; i += 2)
        {
            var callback = finallyFuncs[i + 0];
            var nextFuture = finallyFuncs[i + 1];
            callback(self);
            nextFuture.reject(arg0);
        }
    };
    
    static resolved = function()
    {
        return state != UnknownEnum.Value_0;
    };
    
    static andThen = function(arg0)
    {
        var future;
        
        if (state == UnknownEnum.Value_0)
        {
            future = new Future();
            array_push(thenFuncs, arg0, future);
        }
        else if (state == UnknownEnum.Value_1)
        {
            future = future_ok(arg0(result));
        }
        
        return future;
    };
    
    static andCatch = function(arg0)
    {
        var future;
        
        if (state == UnknownEnum.Value_0)
        {
            future = new Future();
            array_push(catchFuncs, arg0, future);
        }
        else if (state == UnknownEnum.Value_2)
        {
            future = future_ok(arg0(result));
        }
        
        return future;
    };
    
    static andFinally = function(arg0)
    {
        var future;
        
        if (state == UnknownEnum.Value_0)
        {
            future = new Future();
            array_push(finallyFuncs, arg0, future);
        }
        else
        {
            future = future_ok(arg0(self));
        }
        
        return future;
    };
    
    static __resolve = function(arg0, arg1)
    {
        if (state != UnknownEnum.Value_0)
        {
            show_error("future has already been resolved with a value of '" + string(result) + "'", false);
            exit;
        }
        
        result = arg1;
        state = arg0;
    };
    
    self.state = UnknownEnum.Value_0;
    self.result = undefined;
    self.thenFuncs = [];
    self.catchFuncs = [];
    self.finallyFuncs = [];
    self.__futureFlag__ = true;
}

function future_all(arg0)
{
    var count = array_length(arg0);
    var newFuture = new Future();
    
    if (count == 0)
    {
        newFuture.accept([]);
    }
    else
    {
        var joinData = 
        {
            future: newFuture,
            count: count,
            results: array_create(count, undefined)
        };
        
        for (var i = 0; i < count; i += 1)
        {
            var future = arg0[i];
            future.andThen(method(
            {
                pos: i,
                joinData: joinData
            }, function(arg0)
            {
                var future = joinData.future;
                
                if (future.resolved())
                    exit;
                
                var results = joinData.results;
                results[pos] = arg0;
                joinData.count -= 1;
                
                if (joinData.count <= 0)
                    future.accept(results);
            }));
            future.andCatch(method(joinData, function(arg0)
            {
                if (future.resolved())
                    exit;
                
                future.reject(arg0);
            }));
        }
    }
    
    return newFuture;
}

function future_any(arg0)
{
    var count = array_length(arg0);
    var newFuture = new Future();
    
    if (count == 0)
    {
        newFuture.reject([]);
    }
    else
    {
        var joinData = 
        {
            future: newFuture,
            count: count,
            results: array_create(count, undefined)
        };
        
        for (var i = 0; i < count; i += 1)
        {
            var future = arg0[i];
            future.andThen(method(joinData, function(arg0)
            {
                if (future.resolved())
                    exit;
                
                future.accept(arg0);
            }));
            future.andCatch(method(
            {
                pos: i,
                joinData: joinData
            }, function(arg0)
            {
                var future = joinData.future;
                
                if (future.resolved())
                    exit;
                
                var results = joinData.results;
                results[pos] = arg0;
                joinData.count -= 1;
                
                if (joinData.count <= 0)
                    future.reject(results);
            }));
        }
    }
    
    return newFuture;
}

function future_settled(arg0)
{
    var count = array_length(arg0);
    var newFuture = new Future();
    
    if (count == 0)
    {
        newFuture.accept([]);
    }
    else
    {
        var joinData = 
        {
            future: newFuture,
            count: count,
            results: array_create(count, undefined)
        };
        
        for (var i = 0; i < count; i += 1)
        {
            var future = arg0[i];
            future.andFinally(method(
            {
                pos: i,
                joinData: joinData
            }, function(arg0)
            {
                var future = joinData.future;
                
                if (future.resolved())
                    exit;
                
                var results = joinData.results;
                results[pos] = arg0;
                joinData.count -= 1;
                
                if (joinData.count <= 0)
                    future.accept(results);
            }));
        }
    }
    
    return newFuture;
}

function future_ok(arg0)
{
    if (is_future(arg0))
        return arg0;
    
    var future = new Future();
    future.accept(arg0);
    return future;
}

function future_error(arg0)
{
    if (is_future(arg0))
        return arg0;
    
    var future = new Future();
    future.reject(arg0);
    return future;
}

function is_future(arg0)
{
    return is_struct(arg0) && variable_struct_exists(arg0, "__futureFlag__");
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
