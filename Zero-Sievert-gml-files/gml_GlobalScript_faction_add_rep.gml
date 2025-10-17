function faction_add_rep(arg0, arg1, arg2)
{
    if (!variable_struct_exists(struct_get_from_hash(variable_struct_get(global.struct_faction, arg0), variable_get_hash("relationship")), arg1))
        variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, arg0), variable_get_hash("relationship")), arg1, 0);
    
    variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, arg0), variable_get_hash("relationship")), arg1, variable_struct_get(struct_get_from_hash(variable_struct_get(global.struct_faction, arg0), variable_get_hash("relationship")), arg1) + arg2);
    
    if (!variable_struct_exists(struct_get_from_hash(variable_struct_get(global.struct_faction, arg1), variable_get_hash("relationship")), arg0))
        variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, arg1), variable_get_hash("relationship")), arg0, 0);
    
    variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, arg1), variable_get_hash("relationship")), arg0, variable_struct_get(struct_get_from_hash(variable_struct_get(global.struct_faction, arg1), variable_get_hash("relationship")), arg0) + arg2);
    var _max = 1000;
    
    if (arg0 == "Player" || arg1 == "Player")
    {
        if (arg0 == "Player")
        {
            if (variable_struct_get(global.struct_faction, arg1).rep_amount_no_join == 1000)
                _max = 1000;
            else
                _max = variable_struct_get(global.struct_faction, arg1).rep_amount_no_join - 1;
        }
        
        if (arg1 == "Player")
        {
            if (variable_struct_get(global.struct_faction, arg0).rep_amount_no_join == 1000)
                _max = 1000;
            else
                _max = variable_struct_get(global.struct_faction, arg0).rep_amount_no_join - 1;
        }
        
        if (global.faction_joined == "Green Army")
        {
            _max = 1000;
            
            if (arg0 == "Crimson Corporation" || arg1 == "Crimson Corporation")
                _max = 249;
        }
        
        if (global.faction_joined == "Crimson Corporation")
        {
            _max = 1000;
            
            if (arg0 == "Green Army" || arg1 == "Green Army")
                _max = 249;
        }
        
        if (global.end_game_choice == UnknownEnum.Value_35)
            _max = 1000;
    }
    
    variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, arg0), variable_get_hash("relationship")), arg1, clamp(variable_struct_get(struct_get_from_hash(variable_struct_get(global.struct_faction, arg0), variable_get_hash("relationship")), arg1), 0, _max));
    variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, arg1), variable_get_hash("relationship")), arg0, clamp(variable_struct_get(struct_get_from_hash(variable_struct_get(global.struct_faction, arg1), variable_get_hash("relationship")), arg0), 0, _max));
}

enum UnknownEnum
{
    Value_35 = 35
}
