function scr_gamepad_calculate_dir_and_angle(arg0)
{
    arg0[UnknownEnum.Value_19] = point_distance(0, 0, arg0[UnknownEnum.Value_16] - arg0[UnknownEnum.Value_17], arg0[UnknownEnum.Value_15] - arg0[UnknownEnum.Value_14]);
    arg0[UnknownEnum.Value_26] = point_distance(0, 0, arg0[UnknownEnum.Value_23] - arg0[UnknownEnum.Value_24], arg0[UnknownEnum.Value_22] - arg0[UnknownEnum.Value_21]);
    arg0[UnknownEnum.Value_20] = point_direction(0, 0, arg0[UnknownEnum.Value_17] - arg0[UnknownEnum.Value_16], arg0[UnknownEnum.Value_15] - arg0[UnknownEnum.Value_14]);
    arg0[UnknownEnum.Value_27] = point_direction(0, 0, arg0[UnknownEnum.Value_24] - arg0[UnknownEnum.Value_23], arg0[UnknownEnum.Value_22] - arg0[UnknownEnum.Value_21]);
}

enum UnknownEnum
{
    Value_14 = 14,
    Value_15,
    Value_16,
    Value_17,
    Value_19 = 19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_26 = 26,
    Value_27
}
