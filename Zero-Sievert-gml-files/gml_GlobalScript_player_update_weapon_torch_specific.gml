function player_update_weapon_torch_specific(arg0)
{
    var _found = false;
    var _torch_struct = variable_struct_get(torch_container_array[weapon_slot_now].data, arg0);
    var _mod = player_loadout_get_mod(self, weapon_slot_now, arg0);
    
    if (_mod != undefined && item_mod_get_type(_mod) == "torch")
    {
        _found = true;
        var _handguard_mod = player_loadout_get_mod(self, weapon_slot_now, "handguard");
        var _x, _y;
        
        if (item_exists(_handguard_mod))
        {
            _x = item_mod_get_handguard_x(_handguard_mod, arg0) + item_weapon_pos_get_x(arma_now, "handguard");
            _y = item_mod_get_handguard_y(_handguard_mod, arg0) + item_weapon_pos_get_y(arma_now, "handguard");
        }
        else if (!item_weapon_pos_get_moddable(arma_now, "handguard"))
        {
            _x = item_weapon_pos_get_x(arma_now, arg0);
            _y = item_weapon_pos_get_y(arma_now, arg0);
        }
        
        var _ox = sprite_get_xoffset(item_get_sprite_ingame(arma_now));
        var _oy = sprite_get_yoffset(item_get_sprite_ingame(arma_now));
        var _diff_x = abs(_x - _ox);
        var _diff_y = (_y - _oy) + ((arg0 == "att_4") ? -4 : 0);
        var _dir, _off_dir;
        
        if (weapon_holder.image_xscale < 0)
        {
            _dir = weapon_holder.image_angle + 180;
            _off_dir = 90;
        }
        else
        {
            _dir = weapon_holder.image_angle;
            _off_dir = -90;
        }
        
        var nx = 0.4 * (lengthdir_x(_diff_x, _dir) + lengthdir_x(_diff_y, _dir + _off_dir));
        var ny = (0.4 * (lengthdir_y(_diff_x, _dir) + lengthdir_y(_diff_y, _dir + _off_dir))) + 5;
        _torch_struct.x = nx;
        _torch_struct.y = ny;
        _torch_struct.have = true;
        _torch_struct.mod_id = _mod;
        _torch_struct.icon = item_get_sprite_inv(_mod);
    }
    
    if (!_found)
    {
        _torch_struct.have = false;
        _torch_struct.on = false;
    }
}
