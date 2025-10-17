function __catspeak_operator_from_token(arg0)
{
    return arg0 - UnknownEnum.Value_16 - 1;
}

function __catspeak_operator_assign_from_token(arg0)
{
    return arg0 - UnknownEnum.Value_10 - 1;
}

function __catspeak_operator_get_binary(arg0)
{
    var opFunc = global.__catspeakBinOps[arg0];
    
    if (false && opFunc == undefined)
        __catspeak_error_bug();
    
    return opFunc;
}

function __catspeak_operator_get_unary(arg0)
{
    var opFunc = global.__catspeakUnaryOps[arg0];
    
    if (false && opFunc == undefined)
        __catspeak_error_bug();
    
    return opFunc;
}

function __catspeak_op_remainder(arg0, arg1)
{
    return arg0 % arg1;
}

function __catspeak_op_multiply(arg0, arg1)
{
    return arg0 * arg1;
}

function __catspeak_op_divide(arg0, arg1)
{
    return arg0 / arg1;
}

function __catspeak_op_divide_int(arg0, arg1)
{
    return arg0 div arg1;
}

function __catspeak_op_subtract(arg0, arg1)
{
    return arg0 - arg1;
}

function __catspeak_op_plus(arg0, arg1)
{
    return arg0 + arg1;
}

function __catspeak_op_equal(arg0, arg1)
{
    return arg0 == arg1;
}

function __catspeak_op_not_equal(arg0, arg1)
{
    return arg0 != arg1;
}

function __catspeak_op_greater(arg0, arg1)
{
    return arg0 > arg1;
}

function __catspeak_op_greater_equal(arg0, arg1)
{
    return arg0 >= arg1;
}

function __catspeak_op_less(arg0, arg1)
{
    return arg0 < arg1;
}

function __catspeak_op_less_equal(arg0, arg1)
{
    return arg0 <= arg1;
}

function __catspeak_op_shift_right(arg0, arg1)
{
    return arg0 >> arg1;
}

function __catspeak_op_shift_left(arg0, arg1)
{
    return arg0 << arg1;
}

function __catspeak_op_bitwise_and(arg0, arg1)
{
    return arg0 & arg1;
}

function __catspeak_op_bitwise_xor(arg0, arg1)
{
    return arg0 ^ arg1;
}

function __catspeak_op_bitwise_or(arg0, arg1)
{
    return arg0 | arg1;
}

function __catspeak_op_subtract_unary(arg0)
{
    return -arg0;
}

function __catspeak_op_plus_unary(arg0)
{
    return arg0;
}

function __catspeak_op_not_unary(arg0)
{
    return !arg0;
}

function __catspeak_op_bitwise_not_unary(arg0)
{
    return ~arg0;
}

function __catspeak_init_operators()
{
    var binOps = array_create(UnknownEnum.Value_19, undefined);
    var unaryOps = array_create(UnknownEnum.Value_19, undefined);
    binOps[UnknownEnum.Value_0] = __catspeak_op_remainder;
    binOps[UnknownEnum.Value_1] = __catspeak_op_multiply;
    binOps[UnknownEnum.Value_2] = __catspeak_op_divide;
    binOps[UnknownEnum.Value_3] = __catspeak_op_divide_int;
    binOps[UnknownEnum.Value_4] = __catspeak_op_subtract;
    binOps[UnknownEnum.Value_5] = __catspeak_op_plus;
    binOps[UnknownEnum.Value_6] = __catspeak_op_equal;
    binOps[UnknownEnum.Value_7] = __catspeak_op_not_equal;
    binOps[UnknownEnum.Value_8] = __catspeak_op_greater;
    binOps[UnknownEnum.Value_9] = __catspeak_op_greater_equal;
    binOps[UnknownEnum.Value_10] = __catspeak_op_less;
    binOps[UnknownEnum.Value_11] = __catspeak_op_less_equal;
    binOps[UnknownEnum.Value_14] = __catspeak_op_shift_right;
    binOps[UnknownEnum.Value_15] = __catspeak_op_shift_left;
    binOps[UnknownEnum.Value_16] = __catspeak_op_bitwise_and;
    binOps[UnknownEnum.Value_17] = __catspeak_op_bitwise_xor;
    binOps[UnknownEnum.Value_18] = __catspeak_op_bitwise_or;
    unaryOps[UnknownEnum.Value_4] = __catspeak_op_subtract_unary;
    unaryOps[UnknownEnum.Value_5] = __catspeak_op_plus_unary;
    unaryOps[UnknownEnum.Value_12] = __catspeak_op_not_unary;
    unaryOps[UnknownEnum.Value_13] = __catspeak_op_bitwise_not_unary;
    global.__catspeakBinOps = binOps;
    global.__catspeakUnaryOps = unaryOps;
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
    Value_19
}
