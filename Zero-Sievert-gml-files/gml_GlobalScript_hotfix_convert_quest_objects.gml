function hotfix_convert_quest_objects()
{
    var _quest_array = db_read_ext("general", "daily quests", "generated", []);
    var _i = 0;
    
    repeat (array_length(_quest_array))
    {
        var _quest_struct = _quest_array[_i];
        var _objective_array = struct_get_from_hash(_quest_struct, variable_get_hash("objective"));
        
        if (is_array(_objective_array))
        {
            var _j = 0;
            
            repeat (array_length(_objective_array))
            {
                var _objective_struct = _objective_array[_j];
                
                switch (_objective_struct.type)
                {
                    case "kill":
                        var _array_kill = struct_get_from_hash(_objective_struct, variable_get_hash("array_kill"));
                        var _faction = struct_get_from_hash(_objective_struct, variable_get_hash("faction"));
                        
                        switch (_faction)
                        {
                            case "Hunters":
                                _objective_struct.array_kill = global.quest_kill_array.hunter;
                                break;
                            
                            case "Bandits":
                                _objective_struct.array_kill = global.quest_kill_array.bandit;
                                break;
                            
                            case "Green Army soldier":
                                _objective_struct.array_kill = global.quest_kill_array.green_army;
                                break;
                            
                            case "CC soldier":
                                _objective_struct.array_kill = global.quest_kill_array.crimson;
                                break;
                        }
                        
                        break;
                    
                    case "contract":
                        var _object = struct_get_from_hash(_objective_struct, variable_get_hash("object"));
                        var _object_name = struct_get_from_hash(_objective_struct, variable_get_hash("object_name"));
                        
                        if (is_undefined(_object))
                        {
                            trace("Warning! Couldn't find object for quest ", _i, " objective ", _j, " contract");
                        }
                        else if (is_undefined(_object_name))
                        {
                            trace("Warning! Couldn't find object name for quest ", _i, " objective ", _j, " contract");
                        }
                        else if (is_numeric(_object))
                        {
                            trace("Fixing quest ", _i, " objective ", _j, " for contract");
                            
                            switch (_object_name)
                            {
                                case "Bandit":
                                    _objective_struct.object = obj_enemy_human_bandit_novice;
                                    break;
                                
                                case "Big":
                                    _objective_struct.object = obj_enemy_big;
                                    break;
                                
                                case "Hunter":
                                    _objective_struct.object = obj_loner_enemy;
                                    break;
                                
                                case "Infestation":
                                    _objective_struct.object = obj_enemy_infestation;
                                    break;
                                
                                case "Green Army soldier":
                                    _objective_struct.object = obj_green_army_soldier1;
                                    break;
                                
                                case "CC soldier":
                                    _objective_struct.object = obj_crimson_soldier;
                                    break;
                                
                                default:
                                    trace("Warning! Object name \"", _object_name, "\" not recognised for quest ", _i, " objective ", _j, " contract");
                                    _objective_struct.object = obj_enemy_human_bandit_novice;
                                    break;
                            }
                            
                            if (_objective_struct.object != _object)
                                trace("Replaced .object with ", _objective_struct.object, " (", object_get_name(_objective_struct.object), ", old = ", _object, " ", object_get_name(_object), ")");
                        }
                        
                        break;
                    
                    case "place_analyzer":
                        var _object = struct_get_from_hash(_objective_struct, variable_get_hash("object"));
                        var _marker_object = struct_get_from_hash(_objective_struct, variable_get_hash("marker_object"));
                        var _anomaly_generator_id = struct_get_from_hash(_objective_struct, variable_get_hash("anomaly_generator_id"));
                        
                        if (is_undefined(_object))
                        {
                            trace("Warning! Couldn't find object for quest ", _i, " objective ", _j, " place analyzer");
                        }
                        else if (is_undefined(_marker_object))
                        {
                            trace("Warning! Couldn't find marker object for quest ", _i, " objective ", _j, " place analyzer");
                        }
                        else if (is_undefined(_anomaly_generator_id))
                        {
                            trace("Warning! Couldn't find anomaly ID for quest ", _i, " objective ", _j, " place analyzer");
                        }
                        else if (is_numeric(_object))
                        {
                            trace("Fixing quest ", _i, " objective ", _j, " for place analyzer");
                            
                            switch (_anomaly_generator_id)
                            {
                                case UnknownEnum.Value_11:
                                    _objective_struct.object = obj_quest_place_analyzer_1;
                                    _objective_struct.marker_object = obj_quest_place_analyzer_1;
                                    break;
                                
                                case UnknownEnum.Value_12:
                                    _objective_struct.object = obj_quest_place_analyzer_2;
                                    _objective_struct.marker_object = obj_quest_place_analyzer_2;
                                    break;
                                
                                case UnknownEnum.Value_15:
                                    _objective_struct.object = obj_quest_place_analyzer_3;
                                    _objective_struct.marker_object = obj_quest_place_analyzer_3;
                                    break;
                                
                                case UnknownEnum.Value_14:
                                    _objective_struct.object = obj_quest_place_analyzer_4;
                                    _objective_struct.marker_object = obj_quest_place_analyzer_4;
                                    break;
                                
                                default:
                                    trace("Warning! Anomaly ID ", _anomaly_generator_id, " not recognised for quest ", _i, " objective ", _j, " place analyzer");
                                    _objective_struct.object_id = obj_quest_place_analyzer_1;
                                    _objective_struct.marker_object = obj_quest_place_analyzer_1;
                                    break;
                            }
                            
                            if (_objective_struct.object != _object)
                                trace("Replaced .object with ", _objective_struct.object, " (", object_get_name(_objective_struct.object), ", old = ", _object, " ", object_get_name(_marker_object), ")");
                            
                            if (_objective_struct.marker_object != _marker_object)
                                trace("Replaced .marker_object with ", _objective_struct.marker_object, " (", object_get_name(_objective_struct.marker_object), ", old = ", _marker_object, " ", object_get_name(_marker_object), ")");
                        }
                        
                        break;
                    
                    case "retrieve_analyzer":
                        var _chest_obj = struct_get_from_hash(_objective_struct, variable_get_hash("chest_obj"));
                        var _item = struct_get_from_hash(_objective_struct, variable_get_hash("item"));
                        
                        if (is_undefined(_chest_obj))
                        {
                            trace("Warning! Couldn't find object for quest ", _i, " objective ", _j, " retrieve analyzer");
                        }
                        else if (is_undefined(_item))
                        {
                            trace("Warning! Couldn't find anomaly ID for quest ", _i, " objective ", _j, " retrieve analyzer");
                        }
                        else if (is_numeric(_chest_obj))
                        {
                            trace("Fixing quest ", _i, " objective ", _j, " for retrieve analyzer");
                            
                            switch (_item)
                            {
                                case "quest_retrive_analyzer_anomaly_fire_medium":
                                    _objective_struct.chest_obj = obj_chest_retrive_analyzer_anomaly_fire_medium;
                                    break;
                                
                                case "quest_retrive_analyzer_anomaly_fire_big":
                                    _objective_struct.chest_obj = obj_chest_retrive_analyzer_anomaly_fire_big;
                                    break;
                                
                                case "quest_retrive_analyzer_anomaly_gas_big":
                                    _objective_struct.chest_obj = obj_chest_retrive_analyzer_anomaly_gas_big;
                                    break;
                                
                                case "quest_retrive_analyzer_anomaly_gas_medium":
                                    _objective_struct.chest_obj = obj_chest_retrive_analyzer_anomaly_gas_medium;
                                    break;
                                
                                default:
                                    trace("Warning! Item ", _item, " not recognised for quest ", _i, " objective ", _j, " retrieve equipment");
                                    _objective_struct.chest_obj = obj_chest_retrive_analyzer_anomaly_fire_medium;
                                    break;
                            }
                            
                            if (_objective_struct.chest_obj != _chest_obj)
                                trace("Replaced .chest_obj with ", _objective_struct.chest_obj, " (", object_get_name(_objective_struct.chest_obj), ", old = ", _chest_obj, " ", object_get_name(_chest_obj), ")");
                        }
                        
                        break;
                    
                    case "retrieve_equipment":
                        var _marker_object = struct_get_from_hash(_objective_struct, variable_get_hash("marker_object"));
                        var _item = struct_get_from_hash(_objective_struct, variable_get_hash("item"));
                        
                        if (is_undefined(_marker_object))
                        {
                            trace("Warning! Couldn't find object for quest ", _i, " objective ", _j, " retrieve equipment");
                        }
                        else if (is_undefined(_item))
                        {
                            trace("Warning! Couldn't find item for quest ", _i, " objective ", _j, " retrieve equipment");
                        }
                        else if (is_numeric(_marker_object))
                        {
                            trace("Fixing quest ", _i, " objective ", _j, " for retrieve equipment");
                            
                            switch (_item)
                            {
                                case "quest_retrieve_equipment_1":
                                    _objective_struct.marker_object = obj_chest_retrive_equipment_1;
                                    break;
                                
                                case "quest_retrieve_equipment_2":
                                    _objective_struct.marker_object = obj_chest_retrive_equipment_2;
                                    break;
                                
                                default:
                                    trace("Warning! Item ", _item, " not recognised for quest ", _i, " objective ", _j, " retrieve equipment");
                                    _objective_struct.marker_object = obj_chest_retrive_equipment_1;
                                    break;
                            }
                            
                            if (_objective_struct.marker_object != _marker_object)
                                trace("Replaced .marker_object with ", _objective_struct.marker_object, " (", object_get_name(_objective_struct.marker_object), ", old = ", _marker_object, " ", object_get_name(_marker_object), ")");
                        }
                        
                        break;
                }
                
                _j++;
            }
        }
        
        _i++;
    }
    
    trace("hotfix_convert_quest_objects() complete");
}

enum UnknownEnum
{
    Value_11 = 11,
    Value_12,
    Value_14 = 14,
    Value_15
}
