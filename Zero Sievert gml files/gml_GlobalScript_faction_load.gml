function faction_load()
{
    db_open("general");
    global.struct_faction_temp = {};
    global.faction_rel = SnapDeepCopy(db_read("factions", "relationships", 0));
    var _struct_faction = SnapDeepCopy(db_read("factions", "struct", 0));
    
    if (_struct_faction == 0)
        init_factions();
    
    if (global.faction_rel == 0)
        init_faction_rep();
    
    if (_struct_faction != 0)
        SnapMerge(_struct_faction, global.struct_faction, true);
    
    var _faction_count = array_length(variable_struct_get_names(global.struct_faction));
    
    if (is_array(global.faction_rel))
    {
        array_resize(global.faction_rel, _faction_count);
        var _index = struct_get_from_hash(global.struct_faction, variable_get_hash("Watcher")).index;
        var _index_friend = variable_struct_get(global.struct_faction, "All Friend").index;
        
        for (var i = 0; i < _faction_count; i++)
        {
            if (!is_array(global.faction_rel[i]))
                global.faction_rel[i] = array_create(_faction_count);
            else
                array_resize(global.faction_rel[i], _faction_count);
            
            for (var j = 0; j < _faction_count; j++)
            {
                if (i == _index || j == _index)
                    global.faction_rel[i][j] = 0;
                
                if (i == _index && j == _index)
                    global.faction_rel[i][j] = 1000;
                
                if (i == _index_friend || j == _index_friend)
                    global.faction_rel[i][j] = 1000;
            }
        }
    }
    
    global.faction_joined = SnapDeepCopy(db_read("factions", "joined", ""));
    db_close();
    hotfix_convert_factions_to_structs();
}
