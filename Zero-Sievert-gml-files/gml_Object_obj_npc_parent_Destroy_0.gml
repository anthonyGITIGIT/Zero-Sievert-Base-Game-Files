trace("Destroyed NPC ", object_get_name(object_index), ":", id);

if (!delete_npc)
{
    var ss = id;
    
    with (obj_npc_parent)
    {
        if (search_target_id == ss)
        {
            search_target_id = -4;
            state = npc_get_state_patrol(npc_id);
        }
    }
    
    var o = obj_controller;
    var quest_amount = 30;
    
    for (var i = 0; i < quest_amount; i++)
    {
        var quest_id_ = global.quest_state[i].id;
        
        if (quest_id_ != "")
        {
            for (var j = 0; j < array_length(variable_struct_get(global.quest_database, quest_id_).objective); j++)
            {
                switch (variable_struct_get(global.quest_database, quest_id_).objective[j].type)
                {
                    case "contract":
                        if (is_in_raid())
                        {
                            if (object_index == variable_struct_get(global.quest_database, quest_id_).objective[j].object)
                            {
                                if (obj_map_generator.area == variable_struct_get(global.quest_database, quest_id_).objective[j].map)
                                {
                                    if (quest_contract_is_me == true)
                                    {
                                        if (quest_contract_grid_pos == i)
                                        {
                                            global.quest_state[i].amount_now[j] = 1;
                                            obj_controller.alarm[1] = 1;
                                        }
                                    }
                                }
                            }
                        }
                        
                        break;
                }
            }
        }
    }
}

mods_object_perform_event("destroy_event");
