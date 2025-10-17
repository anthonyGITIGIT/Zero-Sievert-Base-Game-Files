function scr_gamepad_apply_deadzone(arg0)
{
    for (var i = 0; i < UnknownEnum.Value_31; i++)
    {
        if (list_of_axis[i])
        {
            arg0[i] = map_value(abs(arg0[i]), deadzone_inner, deadzone_outer, 0, 1);
            arg0[i] = clamp(arg0[i], 0, 1);
        }
    }
}

enum UnknownEnum
{
    Value_31 = 31
}
