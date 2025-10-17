function hotfix_convert_factions_to_structs()
{
    var _faction_find_by_index = function(arg0)
    {
        var _keys = variable_struct_get_names(global.struct_faction);
        
        for (var _i = 0; _i < 10; _i++)
        {
            if (arg0 == variable_struct_get(global.struct_faction, array_get(_keys, _i)).index)
                return _keys[_i];
        }
    };
    
    if (is_array(global.faction_rel))
    {
        var _faction_struct = {};
        var _faction_names = variable_struct_get_names(global.struct_faction);
        
        for (var _i = 0; _i < array_length(_faction_names); _i++)
            variable_struct_get(global.struct_faction, array_get(_faction_names, _i)).relationship = {};
        
        for (var _i = 0; _i < array_length(_faction_names); _i++)
        {
            var _index = variable_struct_get(global.struct_faction, array_get(_faction_names, _i)).index;
            
            for (var _j = 0; _j < 10; _j++)
            {
                var _faction = _faction_find_by_index(_j);
                
                if (!is_undefined(_faction))
                {
                    variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, array_get(_faction_names, _i)), variable_get_hash("relationship")), _faction, global.faction_rel[_index][_j]);
                    variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, _faction), variable_get_hash("relationship")), array_get(_faction_names, _i), global.faction_rel[_j][_index]);
                }
            }
        }
    }
    
    global.struct_faction_temp = SnapDeepCopy(global.struct_faction);
}
