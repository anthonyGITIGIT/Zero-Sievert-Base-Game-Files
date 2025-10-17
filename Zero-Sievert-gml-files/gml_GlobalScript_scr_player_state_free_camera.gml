function scr_player_state_free_camera()
{
    if (!global.general_debug)
    {
        visible = true;
        player_set_local_state(scr_player_state_move);
        exit;
    }
    
    var _spd = 1;
    
    if (global.kb_hold[UnknownEnum.Value_4])
        _spd = 3;
    
    hspd = (global.kb_hold[UnknownEnum.Value_2] - global.kb_hold[UnknownEnum.Value_3]) * _spd;
    vspd = (global.kb_hold[UnknownEnum.Value_1] - global.kb_hold[UnknownEnum.Value_0]) * _spd;
    x += hspd;
    y += vspd;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4
}
