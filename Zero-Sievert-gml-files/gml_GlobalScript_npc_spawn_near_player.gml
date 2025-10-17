function npc_spawn_near_player(arg0, arg1 = 1, arg2 = false)
{
    if (is_in_hub())
        exit;
    
    if (!instance_exists(player_get_local()))
        exit;
    
    var _player = player_get_local();
    var _x, _y;
    
    repeat (500)
    {
        var _dis = irandom_range(240, 280);
        var _angle = irandom(360);
        _x = _player.x + lengthdir_x(_dis, _angle);
        _y = _player.y + lengthdir_y(_dis, _angle);
        
        if (scr_check_position_free(_x, _y))
            break;
    }
    
    repeat (arg1)
    {
        var _obj = instance_create_depth(_x, _y, 0, arg0);
        
        if (arg2)
            _obj.alarm[6] = 5;
    }
}
