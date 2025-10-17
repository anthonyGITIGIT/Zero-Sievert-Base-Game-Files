function bullet_check_for_collisions()
{
    static _npc_list = ds_list_create();
    static _player_list = ds_list_create();
    static _solid_list = ds_list_create();
    
    var _x1 = x;
    var _y1 = y;
    var _x2 = x + hspd;
    var _y2 = y + vspd;
    ds_list_clear(_npc_list);
    ds_list_clear(_player_list);
    ds_list_clear(_solid_list);
    var _solid_count = collision_line_list(_x1, _y1, _x2, _y2, obj_solid, true, true, _solid_list, true);
    var _npc_count = collision_line_list(_x1, _y1, _x2, _y2, obj_npc_parent, true, true, _npc_list, true);
    var _player_count = collision_line_list(_x1, _y1, _x2, _y2, obj_player_parent, true, true, _player_list, true);
    
    if (_npc_count <= 0 && _player_count <= 0 && _solid_count <= 0)
    {
        x += hspd;
        y += vspd;
        exit;
    }
    
    var _target = -4;
    var _target_distance = infinity;
    var _target_type = undefined;
    
    if (_solid_count > 0)
    {
        _target = ds_list_find_value(_solid_list, 0);
        _target_distance = distance_to_object(_target);
        _target_type = 0;
    }
    
    var _i = 0;
    
    repeat (_npc_count)
    {
        var _temp = ds_list_find_value(_npc_list, _i);
        var _distance = distance_to_object(_temp);
        
        if (_distance < _target_distance)
        {
            if (bullet_can_collide_with_npc(self, _temp))
            {
                _target = _temp;
                _target_distance = _distance;
                _target_type = 1;
            }
            
            break;
        }
        else
        {
            break;
        }
        
        _i++;
    }
    
    _i = 0;
    
    repeat (_player_count)
    {
        var _temp = ds_list_find_value(_player_list, _i);
        var _distance = distance_to_object(_temp);
        
        if (_distance < _target_distance)
        {
            if (bullet_can_collide_with_player(self, _temp))
            {
                _target = _temp;
                _target_distance = _distance;
                _target_type = 2;
                break;
            }
        }
        else
        {
            break;
        }
        
        _i++;
    }
    
    if (_target_type == 0 || _target_type == 1 || _target_type == 2)
    {
        while ((abs(_x1 - _x2) + abs(_y1 - _y2)) > 2)
        {
            var _xm = 0.5 * (_x1 + _x2);
            var _ym = 0.5 * (_y1 + _y2);
            
            if (collision_line(_x1, _y1, _xm, _ym, _target, true, true))
            {
                _x2 = _xm;
                _y2 = _ym;
            }
            else
            {
                _x1 = _xm;
                _y1 = _ym;
            }
        }
        
        x = _x1;
        y = _y1;
    }
    
    switch (_target_type)
    {
        case 0:
            bullet_hit_solid(self, _target);
            break;
        
        case 1:
            bullet_hit_npc(self, _target);
            break;
        
        case 2:
            bullet_hit_player(self, _target, object_index == obj_bullet_regular);
            break;
        
        default:
            x += hspd;
            y += vspd;
            break;
    }
}
