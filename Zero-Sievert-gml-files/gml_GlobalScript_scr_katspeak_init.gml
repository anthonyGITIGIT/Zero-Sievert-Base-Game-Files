function katspeak_collect()
{
    __katspeak_check_init();
    var pool = global.__katspeakAllocPool;
    var poolSize = array_length(pool) - 1;
    
    for (var i = poolSize; i >= 0; i -= 1)
    {
        var weakRef = pool[i];
        
        if (weak_ref_alive(weakRef))
            continue;
        
        weakRef.adapter.destroy(weakRef.ds);
        array_delete(pool, i, 1);
    }
}

function __katspeak_alloc(arg0, arg1)
{
    var pool = global.__katspeakAllocPool;
    var poolMax = array_length(pool) - 1;
    
    if (poolMax >= 0)
    {
        repeat (3)
        {
            var i = irandom(poolMax);
            weakRef = pool[i];
            
            if (weak_ref_alive(weakRef))
                continue;
            
            weakRef.adapter.destroy(weakRef.ds);
            var newWeakRef = weak_ref_create(arg0);
            resource = arg1.create();
            newWeakRef.adapter = arg1;
            newWeakRef.ds = resource;
            pool[i] = newWeakRef;
            return resource;
        }
    }
    
    var weakRef = weak_ref_create(arg0);
    var resource = arg1.create();
    weakRef.adapter = arg1;
    weakRef.ds = resource;
    array_push(pool, weakRef);
    return resource;
}

function __katspeak_alloc_ds_map(arg0)
{
    return __katspeak_alloc(arg0, global.__katspeakAllocDSMapAdapter);
}

function __katspeak_alloc_ds_list(arg0)
{
    return __katspeak_alloc(arg0, global.__katspeakAllocDSListAdapter);
}

function __katspeak_alloc_ds_stack(arg0)
{
    return __katspeak_alloc(arg0, global.__katspeakAllocDSStackAdapter);
}

function __katspeak_alloc_ds_priority(arg0)
{
    return __katspeak_alloc(arg0, global.__katspeakAllocDSPriorityAdapter);
}

function __katspeak_init_alloc()
{
    global.__katspeakAllocPool = [];
    global.__katspeakAllocDSMapAdapter = 
    {
        create: ds_map_create,
        destroy: ds_map_destroy
    };
    global.__katspeakAllocDSListAdapter = 
    {
        create: ds_list_create,
        destroy: ds_list_destroy
    };
    global.__katspeakAllocDSStackAdapter = 
    {
        create: ds_stack_create,
        destroy: ds_stack_destroy
    };
    global.__katspeakAllocDSPriorityAdapter = 
    {
        create: ds_priority_create,
        destroy: ds_priority_destroy
    };
}

function katspeak_location_create(arg0, arg1)
{
    __katspeak_check_arg_size_bits("row", arg0, 20);
    __katspeak_check_arg_size_bits("column", arg1, 12);
    var bitsRow = arg0 & 1048575;
    var bitsCol = (arg1 << 20) & 4293918720;
    return bitsRow | bitsCol;
}

function katspeak_location_get_row(arg0)
{
    __katspeak_check_arg_size_bits("location", arg0, 32);
    return arg0 & 1048575;
}

function katspeak_location_get_column(arg0)
{
    __katspeak_check_arg_size_bits("location", arg0, 32);
    return (arg0 & 4293918720) >> 20;
}

function __katspeak_location_show(arg0)
{
    var msg = "in a file";
    
    if (arg0 != undefined)
        msg += (" at (line " + __katspeak_string(katspeak_location_get_row(arg0)) + ", column " + __katspeak_string(katspeak_location_get_column(arg0)) + ")");
    
    return msg;
}

function __katspeak_location_show_ext(arg0)
{
    var msg = __katspeak_location_show(arg0);
    
    if (argument_count > 1)
    {
        msg += " -- ";
        
        for (var i = 1; i < argument_count; i += 1)
            msg += __katspeak_string(argument[i]);
    }
    
    return msg;
}

function __katspeak_is_withable(arg0)
{
    if (is_handle(arg0) && (object_exists(arg0) || instance_exists(arg0)))
        return true;
    
    if (is_numeric(arg0))
    {
        if (arg0 < 0)
            return false;
        
        var isInst = false;
        
        try
        {
            isInst = object_exists(arg0) || instance_exists(arg0);
        }
        catch (_)
        {
        }
        
        return isInst;
    }
    
    var type_ = typeof(arg0);
    return type_ == "struct" || (type_ == "ref" && (object_exists(arg0) || instance_exists(arg0)));
}

function __katspeak_is_callable(arg0)
{
    return is_method(arg0) && !is_numeric(arg0);
}

function __katspeak_is_nullish(arg0)
{
    return arg0 == undefined || arg0 == pointer_null;
}

function __katspeak_string(arg0)
{
    return is_string(arg0) ? arg0 : string(arg0);
}

function __katspeak_error()
{
    var msg = "Katspeak v3.1.1";
    
    if (argument_count > 0)
    {
        msg += ": ";
        
        for (var i = 0; i < argument_count; i += 1)
            msg += __katspeak_string(argument[i]);
    }
    
    show_error(msg, false);
}

function __katspeak_error_silent()
{
    var msg = "Katspeak v3.1.1";
    
    if (argument_count > 0)
    {
        msg += ": ";
        
        for (var i = 0; i < argument_count; i += 1)
            msg += __katspeak_string(argument[i]);
    }
    
    show_debug_message(msg);
}

function __katspeak_error_got(arg0, arg1)
{
    var gotStr;
    
    if (is_numeric(arg1))
        gotStr = string(arg1);
    else if (is_string(arg1) && string_length(arg1) < 16)
        gotStr = arg1;
    else
        gotStr = typeof(arg1);
    
    __katspeak_error(arg0, ", got '", gotStr, "'");
}

function __katspeak_error_bug()
{
    __katspeak_error("you have likely encountered a compiler bug! ", "please get in contact and report this as an issue on the official ", "GitHub page: https://github.com/katsaii/katspeak-lang/issues");
}

function __katspeak_error_unimplemented(arg0)
{
    __katspeak_error("the feature '", arg0, "' has not been implemented yet");
}

function __katspeak_error_deprecated(arg0, arg1 = undefined)
{
    if (__katspeak_is_nullish(arg1))
        __katspeak_error_silent("'", arg0, "' isn't supported anymore");
    else
        __katspeak_error_silent("'", arg0, "' isn't supported anymore", ", use '", arg1, "' instead");
}

function __katspeak_check_init()
{
    if (katspeak_force_init())
        __katspeak_error("Katspeak was not initialised at this point, make sure to call ", "'katspeak_force_init' at the start of your code if you are ", "using Katspeak inside of a script resource");
}

function __katspeak_infer_type_from_predicate(arg0)
{
    switch (arg0)
    {
        case is_string:
            return "string";
            break;
        
        case is_real:
            return "real";
            break;
        
        case is_numeric:
            return "numeric";
            break;
        
        case is_bool:
            return "bool";
            break;
        
        case is_array:
            return "array";
            break;
        
        case is_struct:
            return "struct";
            break;
        
        case is_method:
            return "method";
            break;
        
        case __katspeak_is_callable:
            return "callable";
            break;
        
        case is_ptr:
            return "pointer";
            break;
        
        case is_int32:
            return "int32";
            break;
        
        case is_int64:
            return "int64";
            break;
        
        case is_undefined:
            return "undefined";
            break;
        
        case is_nan:
            return "NaN";
            break;
        
        case is_infinity:
            return "infinity";
            break;
        
        case buffer_exists:
            return "buffer";
            break;
    }
    
    return undefined;
}

function __katspeak_check_arg(arg0, arg1, arg2, arg3 = undefined)
{
    if (arg2(arg1))
        exit;
    
    arg3 ??= __katspeak_infer_type_from_predicate(arg2);
    __katspeak_error("expected argument '", arg0, "' to be of type '", arg3, "'", ", but got '", typeof(arg1), "' instead");
}

function __katspeak_check_arg_optional(arg0, arg1, arg2, arg3 = undefined)
{
    if (arg1 == undefined)
        exit;
    
    return __katspeak_check_arg(arg0, arg1, arg2, arg3);
}

function __katspeak_check_arg_not(arg0, arg1, arg2, arg3 = undefined)
{
    if (!arg2(arg1))
        exit;
    
    arg3 ??= __katspeak_infer_type_from_predicate(arg2);
    __katspeak_error("expected argument '", arg0, "' to be any type EXCEPT of type '", arg3, "'");
}

function __katspeak_check_arg_struct(arg0, arg1)
{
    __katspeak_check_arg(arg0, arg1, is_struct);
    
    for (var i = 2; i < argument_count; i += 2)
    {
        var varName = argument[i];
        var varFunc = argument[i + 1];
        
        if (!variable_struct_exists(arg1, varName))
            __katspeak_error("expected struct argument '", arg0, "' to contain a variable '", varName, "'");
        
        if (varFunc != undefined)
            __katspeak_check_arg(arg0 + "." + varName, variable_struct_get(arg1, varName), varFunc);
    }
}

function __katspeak_check_arg_struct_instanceof(arg0, arg1, arg2)
{
    __katspeak_check_arg(arg0, arg1, is_struct);
    var actual = instanceof(arg1);
    
    if (actual != arg2)
        __katspeak_error("expected struct argument '", arg0, "' to be an instance of '", arg2, "', but got '", actual, "'");
}

function __katspeak_check_arg_size_bits(arg0, arg1, arg2)
{
    __katspeak_check_arg(arg0, arg1, is_numeric);
    
    if (arg1 < 0)
        __katspeak_error("argument '", arg0, "' must not be negative, got", arg1);
    
    if (arg1 >= power(2, arg2))
        __katspeak_error("argument '", arg0, "' is too large (", arg1, ") it must fit within ", arg2, " bits");
}

function __katspeak_check_global_exists(arg0)
{
    if (!variable_global_exists(arg0))
        __katspeak_error("global variable '", arg0, "' does not exist");
}

function katspeak_force_init()
{
    static initialised = false;
    
    if (initialised)
        return false;
    
    initialised = true;
    global.__katspeakConfig = {};
    __katspeak_init_alloc();
    __katspeak_init_operators();
    __katspeak_init_presets();
    __katspeak_init_lexer();
    __katspeak_init_codegen();
    __katspeak_init_engine();
    var motd = "you are now using Katspeak v3.1.1 by @katsaii";
    show_debug_message(motd);
    return true;
}

katspeak_force_init();
