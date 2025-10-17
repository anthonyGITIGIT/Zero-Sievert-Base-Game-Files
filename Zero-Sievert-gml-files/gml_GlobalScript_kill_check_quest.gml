function kill_check_quest(arg0)
{
    if (is_in_raid())
    {
        var _exp = npc_get_experience(arg0);
        global.xp_kill += (_exp * global.sk_k[UnknownEnum.Value_61]);
        var _gun_type = "";
        
        with (player_get_local())
            _gun_type = item_weapon_get_type(arma_now);
        
        switch (_gun_type)
        {
            case "pistol":
                global.pistol_kill_count++;
                global.pistol_exp += _exp;
                break;
            
            case "smg":
                global.smg_kill_count++;
                global.smg_exp += _exp;
                break;
            
            case "shotgun":
                global.shotgun_kill_count++;
                global.shotgun_exp += _exp;
                break;
            
            case "rifle":
                global.rifle_kill_count++;
                global.rifle_exp += _exp;
                break;
            
            case "dmr":
                global.dmr_kill_count++;
                global.dmr_exp += _exp;
                break;
            
            case "sniper":
                global.sniper_kill_count++;
                global.sniper_exp += _exp;
                break;
            
            default:
                show_debug_message("Warning: We should never be here, an enemy was killed by a weapon and we didnt know the type");
                break;
        }
        
        skills_update_masteries();
        
        for (var i = 0; i < 30; i++)
        {
            var quest_id_ = global.quest_state[i].id;
            
            if (quest_id_ != "")
            {
                for (var j = 0; j < array_length(variable_struct_get(global.quest_database, quest_id_).objective); j++)
                {
                    switch (variable_struct_get(global.quest_database, quest_id_).objective[j].type)
                    {
                        case "kill":
                            var _map = variable_struct_get(global.quest_database, quest_id_).objective[j].map;
                            
                            if (_map == -1 || _map == obj_map_generator.area)
                            {
                                var _array_obj_to_kill = variable_struct_get(global.quest_database, quest_id_).objective[j].array_kill;
                                var _obj_to_check = array_length(_array_obj_to_kill);
                                
                                for (var k = 0; k < _obj_to_check; k++)
                                {
                                    if (arg0 == _array_obj_to_kill[k])
                                    {
                                        if (global.quest_state[i].amount_now[j] < variable_struct_get(global.quest_database, quest_id_).objective[j].amount_max)
                                            global.quest_state[i].amount_now[j] += 1;
                                    }
                                }
                            }
                            
                            break;
                    }
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_61 = 61
}
