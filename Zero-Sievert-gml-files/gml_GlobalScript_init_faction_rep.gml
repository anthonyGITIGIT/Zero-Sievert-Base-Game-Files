function init_faction_rep()
{
    var fr = global.struct_faction;
    var _index_player = struct_get_from_hash(fr, variable_get_hash("Player")).index;
    var _index_loner = struct_get_from_hash(fr, variable_get_hash("Loners")).index;
    var _index_ga = variable_struct_get(fr, "Green Army").index;
    var _index_cc = variable_struct_get(fr, "Crimson Corporation").index;
    var _index_scientist = struct_get_from_hash(fr, variable_get_hash("Scientists")).index;
    var _index_bandit = struct_get_from_hash(fr, variable_get_hash("Bandits")).index;
    var _index_mutant = struct_get_from_hash(fr, variable_get_hash("Mutants")).index;
    var _index_enemy = variable_struct_get(fr, "All Enemy").index;
    var _index_friend = variable_struct_get(fr, "All Friend").index;
    var _index_watcher = struct_get_from_hash(fr, variable_get_hash("Watcher")).index;
    
    for (var i = 0; i < 10; i++)
    {
        for (var j = 0; j < 10; j++)
            global.faction_rel[i][j] = -1;
    }
    
    for (var i = 0; i < 10; i++)
    {
        for (var j = 0; j < 10; j++)
        {
            if (i == _index_enemy || j == _index_enemy)
                global.faction_rel[i][j] = 0;
            
            if (i == _index_watcher || j == _index_watcher)
                global.faction_rel[i][j] = 0;
            
            if (i == _index_mutant || j == _index_mutant)
                global.faction_rel[i][j] = 0;
            
            if (i == _index_friend || j == _index_friend)
                global.faction_rel[i][j] = 1000;
            
            if (i == j)
            {
                global.faction_rel[i][j] = 1000;
                
                if (i == _index_enemy || j == _index_enemy)
                    global.faction_rel[i][j] = 0;
            }
        }
    }
    
    global.faction_rel[_index_player][_index_loner] = 300;
    global.faction_rel[_index_player][_index_ga] = 300;
    global.faction_rel[_index_player][_index_cc] = 300;
    global.faction_rel[_index_player][_index_scientist] = 300;
    global.faction_rel[_index_player][_index_bandit] = 0;
    global.faction_rel[_index_loner][_index_ga] = 0;
    global.faction_rel[_index_loner][_index_cc] = 0;
    global.faction_rel[_index_loner][_index_scientist] = 300;
    global.faction_rel[_index_loner][_index_bandit] = 0;
    global.faction_rel[_index_ga][_index_cc] = 0;
    global.faction_rel[_index_ga][_index_scientist] = 300;
    global.faction_rel[_index_ga][_index_bandit] = 0;
    global.faction_rel[_index_cc][_index_scientist] = 300;
    global.faction_rel[_index_cc][_index_bandit] = 0;
    global.faction_rel[_index_scientist][_index_bandit] = 0;
    
    for (var i = 0; i < 10; i++)
    {
        for (var j = 0; j < 10; j++)
        {
            if (global.faction_rel[i][j] == -1)
                global.faction_rel[i][j] = global.faction_rel[j][i];
        }
    }
}
