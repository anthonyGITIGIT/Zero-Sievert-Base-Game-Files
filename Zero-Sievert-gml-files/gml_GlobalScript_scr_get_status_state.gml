function scr_get_status_state(arg0, arg1)
{
    var mood = arg0;
    var t = arg1;
    var sta = 0;
    
    if (t >= global.status_state[mood][0])
        sta = UnknownEnum.Value_0;
    else if (t < global.status_state[mood][0] && t >= global.status_state[mood][1])
        sta = UnknownEnum.Value_1;
    else if (t < global.status_state[mood][1] && t >= global.status_state[mood][2])
        sta = UnknownEnum.Value_2;
    else if (t < global.status_state[mood][2] && t >= global.status_state[mood][3])
        sta = UnknownEnum.Value_3;
    else if (t < global.status_state[mood][3])
        sta = UnknownEnum.Value_4;
    
    if (mood == UnknownEnum.Value_3)
    {
        if (t <= global.status_state[mood][0])
            sta = UnknownEnum.Value_0;
        else if (t > global.status_state[mood][0] && t <= global.status_state[mood][1])
            sta = UnknownEnum.Value_1;
        else if (t > global.status_state[mood][1] && t <= global.status_state[mood][2])
            sta = UnknownEnum.Value_2;
        else if (t > global.status_state[mood][2] && t <= global.status_state[mood][3])
            sta = UnknownEnum.Value_3;
        else if (t > global.status_state[mood][3])
            sta = UnknownEnum.Value_4;
    }
    
    return sta;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4
}
