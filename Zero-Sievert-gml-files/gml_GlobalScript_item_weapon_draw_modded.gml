function item_weapon_draw_modded(arg0, arg1, arg2 = 0, arg3 = 0, arg4 = 1, arg5 = 16777215, arg6 = 1)
{
    static _draw_order = ["stock", "grip", "barrel", "handguard", "magazine", "scope", "brake", "att_1", "att_2", "att_3", "att_4"];
    
    var _brake_pos = item_weapon_get_modded_brake_pos(arg0, arg1);
    draw_sprite_ext(item_get_sprite_inv(arg0), 0, arg2, arg3, arg4, arg4, 0, arg5, arg6);
    var _i = 0;
    
    repeat (array_length(global.mod_pos_data_array))
    {
        var _mod_pos = global.mod_pos_data_array[_i];
        var _mod = loot_mod_cont_get(arg1, _mod_pos);
        
        if (_mod != undefined)
        {
            switch (_mod_pos)
            {
                case "brake":
                    if (loot_mod_cont_exists(arg1, "barrel"))
                        draw_sprite_ext(item_get_sprite_ingame(_mod), 0, arg2 + _brake_pos.x, arg3 + _brake_pos.y, arg4, arg4, 0, arg5, arg6);
                    else if (!item_weapon_pos_get_moddable(arg0, "barrel"))
                        draw_sprite_ext(item_get_sprite_ingame(_mod), 0, arg2 + item_weapon_pos_get_x(arg0, _mod_pos), arg3 + item_weapon_pos_get_y(arg0, _mod_pos), arg4, arg4, 0, arg5, arg6);
                    
                    break;
                
                case "att_1":
                case "att_2":
                case "att_3":
                case "att_4":
                    var _flip = (_mod_pos == "att_4" && (item_mod_get_type(_mod) == "laser" || item_mod_get_type(_mod) == "torch")) ? -1 : 1;
                    var _handguard_mod = loot_mod_cont_get(arg1, "handguard");
                    
                    if (item_mod_handguard_pos_exists(_handguard_mod, _mod_pos))
                    {
                        var _xa = arg2 + item_mod_get_handguard_x(_handguard_mod, _mod_pos) + item_weapon_pos_get_x(arg0, "handguard");
                        var _ya = arg3 + item_mod_get_handguard_y(_handguard_mod, _mod_pos) + item_weapon_pos_get_y(arg0, "handguard");
                        draw_sprite_ext(item_get_sprite_ingame(_mod), 0, _xa, _ya, arg4, _flip * arg4, 0, arg5, arg6);
                    }
                    else if (!item_weapon_pos_get_moddable(arg0, "barrel"))
                    {
                        var _xa = arg2 + item_weapon_pos_get_x(arg0, _mod_pos);
                        var _ya = arg3 + item_weapon_pos_get_y(arg0, _mod_pos);
                        draw_sprite_ext(item_get_sprite_ingame(_mod), 0, _xa, _ya, arg4, _flip * arg4, 0, arg5, arg6);
                    }
                    
                    break;
                
                default:
                    var _sprite = item_get_sprite_ingame(_mod);
                    
                    if (_sprite != s_vuoto && sprite_exists(_sprite))
                        draw_sprite_ext(_sprite, 0, arg2 + item_weapon_pos_get_x(arg0, _mod_pos), arg3 + item_weapon_pos_get_y(arg0, _mod_pos), arg4, arg4, 0, arg5, arg6);
                    
                    break;
            }
        }
        
        _i++;
    }
}
