function class_weapon_possible_mods(arg0) constructor
{
    static Initialize = function()
    {
        var _i = 0;
        
        repeat (array_length(global.mod_pos_data_array))
        {
            var _mod_pos = global.mod_pos_data_array[_i];
            variable_struct_set(data, _mod_pos, []);
            _i++;
        }
    };
    
    static AddMod = function(arg0)
    {
        var _position_array = item_mod_get_position_array(arg0);
        var _i = 0;
        
        repeat (array_length(_position_array))
        {
            if (!array_contains(variable_struct_get(data, array_get(_position_array, _i)), arg0))
                array_push(variable_struct_get(data, array_get(_position_array, _i)), arg0);
            
            _i++;
        }
    };
    
    static Generate = function(arg0)
    {
        var _result = new class_weapon_random_mods();
        var _i = 0;
        
        repeat (array_length(global.mod_pos_data_array))
        {
            var _mod_pos = global.mod_pos_data_array[_i];
            var _default = item_weapon_pos_get_default_id(weapon_id, _mod_pos);
            
            if (item_exists(_default))
                _result.AddMod(_mod_pos, _default);
            
            var _mod_array = variable_struct_get(data, _mod_pos);
            var _j = 0;
            
            repeat (array_length(_mod_array))
            {
                var _mod_id = _mod_array[_j];
                var _diff;
                
                if (arg0 != 5)
                {
                    _diff = ceil(power(max(0, (1 + arg0) - item_mod_get_value(_mod_id)), 1.5));
                    
                    if (item_mod_get_type(_mod_id) == "silencer" && scr_chance(80))
                        _diff = 0;
                }
                else
                {
                    _diff = ceil(power(max(0, item_mod_get_value(_mod_id)), 1.5));
                }
                
                repeat (_diff)
                    _result.AddMod(_mod_pos, _mod_id);
                
                _j++;
            }
            
            if (item_weapon_pos_get_moddable(weapon_id, _mod_pos) && !item_exists(item_weapon_pos_get_default_id(weapon_id, _mod_pos)))
            {
                if (arg0 != 5)
                {
                    var _count;
                    
                    switch (_mod_pos)
                    {
                        case "att_1":
                        case "att_2":
                        case "att_3":
                        case "att_4":
                            _count = array_length(_mod_array);
                            break;
                        
                        case "brake":
                            _count = 10;
                            break;
                        
                        default:
                            _count = 1;
                            break;
                    }
                    
                    repeat (_count)
                        _result.AddMod(_mod_pos, "no_item");
                }
            }
            
            _i++;
        }
        
        return _result;
    };
    
    weapon_id = arg0;
    data = {};
    Initialize();
}
