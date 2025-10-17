function preset_assign_to_npc(arg0)
{
    var _npc_id = -1;
    var _preset;
    
    if (is_in_raid())
    {
        var _map = obj_map_generator.area;
        var _lvl = global.xp_level_now;
        var _k = _lvl / 2;
        _k = clamp(_k, 1, 4);
        _preset = "rookie";
        var _random = random(100);
        
        if (_map == UnknownEnum.Value_6)
            _k *= 1.25;
        
        if (_map == UnknownEnum.Value_8)
            _k *= 1.5;
        
        if (quest_is_complete("gate_sewer"))
        {
            if (_random > (0 * _k))
                _preset = choose("master", "master", "cyclops");
            
            if (_random > (5 * _k))
                _preset = "veteran";
        }
        
        if (quest_is_complete("kill_orel"))
        {
            if (_random > (10 * _k))
                _preset = "expert";
            
            if (_random > (20 * _k))
                _preset = "skilled";
        }
        
        if (_random > (35 * _k))
            _preset = "intermediate";
        
        if (_random > (50 * _k))
            _preset = "rookie";
        
        switch (arg0)
        {
            case "Bandits":
                switch (_preset)
                {
                    case "rookie":
                        _npc_id = "bandit_rookie";
                        break;
                    
                    case "intermediate":
                        _npc_id = "bandit_intermediate";
                        break;
                    
                    case "expert":
                        _npc_id = "bandit_expert";
                        break;
                    
                    case "skilled":
                        _npc_id = "bandit_skilled";
                        break;
                    
                    case "veteran":
                        _npc_id = "bandit_veteran";
                        break;
                    
                    case "master":
                        _npc_id = "bandit_master";
                        break;
                    
                    case "cyclops":
                        _npc_id = "bandit_master";
                        break;
                }
                
                break;
            
            case "Green Army":
                switch (_preset)
                {
                    case "rookie":
                        _npc_id = "green_army_rookie";
                        break;
                    
                    case "intermediate":
                        _npc_id = "green_army_intermediate";
                        break;
                    
                    case "expert":
                        _npc_id = "green_army_expert";
                        break;
                    
                    case "skilled":
                        _npc_id = "green_army_skilled";
                        break;
                    
                    case "veteran":
                        _npc_id = "green_army_veteran";
                        break;
                    
                    case "master":
                        _npc_id = "green_army_master";
                        break;
                    
                    case "cyclops":
                        _npc_id = "green_army_cyclops";
                        break;
                }
                
                break;
            
            case "Crimson Corporation":
                switch (_preset)
                {
                    case "rookie":
                        _npc_id = "crimson_rookie";
                        break;
                    
                    case "intermediate":
                        _npc_id = "crimson_intermediate";
                        break;
                    
                    case "expert":
                        _npc_id = "crimson_expert";
                        break;
                    
                    case "skilled":
                        _npc_id = "crimson_skilled";
                        break;
                    
                    case "veteran":
                        _npc_id = "crimson_veteran";
                        break;
                    
                    case "master":
                        _npc_id = "crimson_master";
                        break;
                    
                    case "cyclops":
                        _npc_id = "crimson_cyclops";
                        break;
                }
                
                break;
            
            case "Hunter":
                switch (_preset)
                {
                    case "rookie":
                        _npc_id = "hunter_rookie";
                        break;
                    
                    case "intermediate":
                        _npc_id = "hunter_intermediate";
                        break;
                    
                    case "expert":
                        _npc_id = "hunter_expert";
                        break;
                    
                    case "skilled":
                        _npc_id = "hunter_skilled";
                        break;
                    
                    case "veteran":
                        _npc_id = "hunter_veteran";
                        break;
                    
                    case "master":
                        _npc_id = "hunter_master";
                        break;
                    
                    case "cyclops":
                        _npc_id = "hunter_cyclops";
                        break;
                }
                
                break;
            
            case "Watcher":
                switch (_preset)
                {
                    case "rookie":
                        _npc_id = "watcher_rookie";
                        break;
                    
                    case "intermediate":
                        _npc_id = "watcher_intermediate";
                        break;
                    
                    case "expert":
                        _npc_id = "watcher_expert";
                        break;
                    
                    case "skilled":
                        _npc_id = "watcher_skilled";
                        break;
                    
                    case "veteran":
                        _npc_id = "watcher_veteran";
                        break;
                    
                    case "master":
                        _npc_id = "watcher_master";
                        break;
                    
                    case "cyclops":
                        _npc_id = "watcher_cyclops";
                        break;
                }
                
                break;
        }
    }
    
    if (_npc_id == -1 && !instance_exists(obj_editor))
        trace_error("Unable to assign the preset ", _preset, " for ", arg0);
    
    return _npc_id;
}

enum UnknownEnum
{
    Value_6 = 6,
    Value_8 = 8
}
