function faction_create(arg0)
{
    if (!variable_struct_exists(global.struct_faction, arg0))
    {
        var _names = variable_struct_get_names(global.struct_faction);
        variable_struct_set(global.struct_faction, arg0, 
        {
            id: arg0,
            name: arg0,
            index: array_length(_names),
            rep_hit: 0,
            rep_amount_no_join: 1000,
            rep_daily: 0,
            relationship: {}
        });
        
        for (var _i = 0; _i < array_length(_names); _i++)
            variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, arg0), variable_get_hash("relationship")), array_get(_names, _i), 0);
        
        for (var _i = 0; _i < array_length(_names); _i++)
        {
            for (var _r = 0; _r < array_length(_names); _r++)
            {
                if (_names[_r] == arg0)
                    variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, array_get(_names, _r)), variable_get_hash("relationship")), array_get(_names, _i), 0);
            }
        }
    }
}
