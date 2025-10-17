function class_weapon_random_mods() constructor
{
    static Initialize = function()
    {
        var _i = 0;
        
        repeat (array_length(global.mod_pos_data_array))
        {
            var _name = global.mod_pos_data_array[_i];
            variable_struct_set(data, _name, []);
            _i++;
        }
    };
    
    static AddMod = function(arg0, arg1)
    {
        array_push(variable_struct_get(data, arg0), arg1);
    };
    
    static ChooseMod = function(arg0)
    {
        var _array = variable_struct_get(data, arg0);
        
        if (array_length(_array) <= 0)
            return "no_item";
        
        return _array[irandom(array_length(_array) - 1)];
    };
    
    static ChooseAll = function(arg0)
    {
        var _i = 0;
        
        repeat (array_length(global.mod_pos_data_array))
        {
            var _mod_pos = global.mod_pos_data_array[_i];
            
            if (_mod_pos == "att_1")
            {
                if (loot_mod_cont_exists(arg0, "handguard") && item_mod_handguard_pos_exists(loot_mod_cont_get(arg0, "handguard"), _mod_pos))
                    loot_mod_cont_set(arg0, _mod_pos, ChooseMod(_mod_pos));
            }
            else if (_mod_pos != "att_2" && _mod_pos != "att_3" && _mod_pos != "att_4")
            {
                loot_mod_cont_set(arg0, _mod_pos, ChooseMod(_mod_pos));
            }
            else
            {
                loot_mod_cont_delete(arg0, _mod_pos);
            }
            
            _i++;
        }
    };
    
    data = {};
    Initialize();
}
