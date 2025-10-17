function quest_daily_retrieve_equipment_choose_building(arg0, arg1)
{
    var ii = arg1;
    
    if (is_in_raid())
    {
        for (var j = 0; j < 30; j++)
        {
            var _quest_active_id = global.quest_state[j].id;
            
            if (_quest_active_id != "")
            {
                var _quest_struct = variable_struct_get(global.quest_database, _quest_active_id);
                var _array_objective = _quest_struct.objective;
                
                for (var i = 0; i < array_length(_array_objective); i++)
                {
                    var _struct_objective = _array_objective[i];
                    
                    if (_struct_objective.type == "retrieve_equipment")
                    {
                        if (instance_exists(obj_map_generator))
                        {
                            if (obj_map_generator.area == _struct_objective.map)
                            {
                                if (global.quest_state[j].amount_now[i] < _struct_objective.amount_max)
                                {
                                    var _faction = _struct_objective.faction;
                                    
                                    if (_faction == "Green Army")
                                    {
                                        area_building_list[a][ii] = list_building_quest_retrieve_equipment_ga;
                                        area_building_w[a][ii] = 10;
                                        area_building_h[a][ii] = 10;
                                        area_building_amount[a][ii] = 1;
                                        area_building_marker[a][ii] = -1;
                                        area_building_peso[a][ii] = 0;
                                        ii++;
                                    }
                                    
                                    if (_faction == "Crimson Corporation")
                                    {
                                        area_building_list[a][ii] = list_building_quest_retrieve_equipment_cc;
                                        area_building_w[a][ii] = 10;
                                        area_building_h[a][ii] = 10;
                                        area_building_amount[a][ii] = 1;
                                        area_building_marker[a][ii] = -1;
                                        area_building_peso[a][ii] = 0;
                                        ii++;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    return ii;
}
