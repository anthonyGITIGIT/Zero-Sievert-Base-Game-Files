function __catspeak_string(arg0)
{
    return is_string(arg0) ? arg0 : string(arg0);
}

function __catspeak_error()
{
    var msg = "Catspeak v3.0.0";
    
    if (argument_count > 0)
    {
        msg += ": ";
        
        for (var i = 0; i < argument_count; i += 1)
            msg += __catspeak_string(argument[i]);
    }
    
    show_error(msg, false);
}

function __catspeak_error_silent()
{
    var msg = "Catspeak v3.0.0";
    
    if (argument_count > 0)
    {
        msg += ": ";
        
        for (var i = 0; i < argument_count; i += 1)
            msg += __catspeak_string(argument[i]);
    }
    
    show_debug_message(msg);
}

function __catspeak_error_got(arg0, arg1)
{
    var gotStr;
    
    if (is_numeric(arg1))
        gotStr = string(arg1);
    else if (is_string(arg1) && string_length(arg1) < 16)
        gotStr = arg1;
    else
        gotStr = typeof(arg1);
    
    __catspeak_error(arg0, ", got '", gotStr, "'");
}

function __catspeak_error_bug()
{
    __catspeak_error("you have likely encountered a compiler bug! ", "please get in contact and report this as an issue on the official ", "GitHub page: https://github.com/katsaii/catspeak-lang/issues");
}

function __catspeak_error_unimplemented(arg0)
{
    __catspeak_error("the feature '", arg0, "' has not been implemented yet");
}

function __catspeak_check_init()
{
    if (catspeak_force_init())
        __catspeak_error("Catspeak was not initialised at this point, make sure to call ", "'catspeak_force_init' at the start of your code if you are ", "using Catspeak inside of a script resource");
}

function __catspeak_check_arg(arg0, arg1, arg2, arg3 = undefined)
{
    if (arg2(arg1))
        exit;
    
    if (arg3 == undefined)
    {
        switch (arg2)
        {
            case is_string:
                arg3 = "string";
                break;
            
            case is_real:
                arg3 = "real";
                break;
            
            case is_numeric:
                arg3 = "numeric";
                break;
            
            case is_bool:
                arg3 = "bool";
                break;
            
            case is_array:
                arg3 = "array";
                break;
            
            case is_struct:
                arg3 = "struct";
                break;
            
            case is_method:
                arg3 = "method";
                break;
            
            case is_ptr:
                arg3 = "pointer";
                break;
            
            case is_int32:
                arg3 = "int32";
                break;
            
            case is_int64:
                arg3 = "int64";
                break;
            
            case is_undefined:
                arg3 = "undefined";
                break;
            
            case is_nan:
                arg3 = "NaN";
                break;
            
            case is_infinity:
                arg3 = "infinity";
                break;
            
            case buffer_exists:
                arg3 = "number";
                break;
        }
    }
    
    __catspeak_error("expected argument '", arg0, "' to be of type '", arg3, "'", ", but got '", typeof(arg1), "' instead");
}

function __catspeak_check_arg_struct(arg0, arg1)
{
    __catspeak_check_arg(arg0, arg1, is_struct);
    
    for (var i = 2; i < argument_count; i += 2)
    {
        var varName = argument[i];
        var varFunc = argument[i + 1];
        
        if (!variable_struct_exists(arg1, varName))
            __catspeak_error("expected struct argument '", arg0, "' to contain a variable '", varName, "'");
        
        if (varFunc != undefined)
            __catspeak_check_arg(arg0 + "." + varName, variable_struct_get(arg1, varName), varFunc);
    }
}

function __catspeak_check_arg_struct_instanceof(arg0, arg1, arg2)
{
    __catspeak_check_arg(arg0, arg1, is_struct);
    var actual = instanceof(arg1);
    
    if (actual != arg2)
        __catspeak_error("expected struct argument '", arg0, "' to be an instance of '", arg2, "', but got '", actual, "'");
}

function __catspeak_check_arg_size_bits(arg0, arg1, arg2)
{
    __catspeak_check_arg(arg0, arg1, is_numeric);
    
    if (arg1 < 0)
        __catspeak_error("argument '", arg0, "' must not be negative, got", arg1);
    
    if (arg1 >= power(2, arg2))
        __catspeak_error("argument '", arg0, "' is too large (", arg1, ") it must fit within ", arg2, " bits");
}

function __catspeak_check_global_exists(arg0)
{
    if (!variable_global_exists(arg0))
        __catspeak_error("global variable '", arg0, "' does not exist");
}
