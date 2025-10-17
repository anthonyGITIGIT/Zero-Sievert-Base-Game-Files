function npc_dialogue_get_quest_objective(arg0, arg1)
{
    var _quest_id = npc_dialogue_get_quest_id(arg0, arg1);
    
    if (_quest_id == undefined)
        return "- ???\n- ???";
    
    return __npc_dialogue_get_quest_objective(_quest_id, undefined, false);
}

function __map_get_name(arg0)
{
    if (arg0 < 0)
        return "any map";
    
    return language_get_string(obj_controller.map_nome[arg0]);
}

function __npc_dialogue_get_quest_objective(arg0, arg1, arg2 = false)
{
    var _total_text = "";
    var _quest_state_proper = arg1;
    
    if (arg2)
    {
        for (var i = 0; i < 30; i++)
        {
            if (global.quest_state[i].id == arg0)
                _quest_state_proper = global.quest_state[i];
        }
        
        if (is_undefined(_quest_state_proper))
        {
            show_error("Failed to find a proper quest state for quest with ID: " + string(arg0), true);
            exit;
        }
    }
    
    var _objective_array = variable_struct_get(global.quest_database, arg0).objective;
    var _i = 0;
    
    repeat (array_length(_objective_array))
    {
        var _objective = _objective_array[_i];
        var _obj_type = struct_get_from_hash(_objective, variable_get_hash("type"));
        var _obj_map = struct_get_from_hash(_objective, variable_get_hash("map"));
        var _obj_amount_max = struct_get_from_hash(_objective, variable_get_hash("amount_max"));
        var _obj_text = struct_get_from_hash(_objective, variable_get_hash("text"));
        var _progress;
        
        if (_quest_state_proper != undefined)
            _progress = string(min(_quest_state_proper.amount_now[_i], _obj_amount_max)) + "/" + string(_obj_amount_max);
        
        var _text_map = "[MAP_NAME]";
        
        if (_obj_text != "")
        {
            _obj_text = language_get_string(_obj_text);
            _total_text += ("- " + _obj_text);
            
            if (_quest_state_proper != undefined)
                _total_text += (" (" + _progress + ")");
            
            _total_text += "\n";
            _i++;
        }
        else
        {
            switch (_obj_type)
            {
                case "kill":
                    var _faction = _objective.faction;
                    var _text_obj_to_kill;
                    
                    if (_faction == "")
                    {
                        var _npc_id = _objective.array_kill[0];
                        _text_obj_to_kill = language_get_string(npc_get_base_name(_npc_id)) + " ";
                    }
                    else
                    {
                        _text_obj_to_kill = language_get_string(_faction) + " ";
                    }
                    
                    var _text = "";
                    
                    if (_obj_map >= 0)
                    {
                        _obj_text = language_get_string("Quest objective type: Kill A");
                        _obj_text = string_replace(_obj_text, "[MAP_NAME]", __map_get_name(_obj_map));
                    }
                    else
                    {
                        _obj_text = language_get_string("Quest objective type: Kill B");
                    }
                    
                    _obj_text = string_replace(_obj_text, "[AMOUNT_TO_KILL]", string(_obj_amount_max));
                    _obj_text = string_replace(_obj_text, "[TARGET_TO_KILL]", language_get_string_iterative(string(_text_obj_to_kill)));
                    break;
                
                case "contract":
                    _obj_text = language_get_string("Quest objective type: Contract");
                    _obj_text = string_replace(_obj_text, "[MAP_NAME]", __map_get_name(_obj_map));
                    _obj_text = string_replace(_obj_text, "[OBJECT_NAME]", language_get_string(_objective.object_name));
                    break;
                
                case "collect":
                    _obj_text = language_get_string("Quest objective type: Collect");
                    _obj_text = string_replace(_obj_text, "[AMOUNT_TO_COLLECT]", string(_obj_amount_max));
                    _obj_text = string_replace(_obj_text, "[ITEM_NAME]", item_get_name(_objective.item));
                    break;
                
                case "collect_weapon":
                    _obj_text = language_get_string("Quest objective type: Collect Weapon");
                    _obj_text = string_replace(_obj_text, "[AMOUNT_TO_COLLECT]", string(_obj_amount_max));
                    _obj_text = string_replace(_obj_text, "[ITEM_NAME]", language_get_string(item_get_name(_objective.item)));
                    break;
                
                case "survive":
                    if (_obj_map >= 0)
                    {
                        _obj_text = language_get_string("Quest objective type: Survive A");
                        _obj_text = string_replace(_obj_text, "[MAP_NAME]", __map_get_name(_obj_map));
                    }
                    else
                    {
                        _obj_text = language_get_string("Quest objective type: Survive B");
                    }
                    
                    _obj_text = string_replace(_obj_text, "[AMOUNT_TO_SURVIVE]", string(_obj_amount_max));
                    break;
                
                case "survive_exp":
                    if (_obj_map >= 0)
                        _obj_text = language_get_string("Quest objective type: Survive Exp A");
                    else
                        _obj_text = language_get_string("Quest objective type: Survive Exp B");
                    
                    _obj_text = string_replace(_obj_text, "[MAP_NAME]", __map_get_name(_obj_map));
                    _obj_text = string_replace(_obj_text, "[AMOUNT_TO_SURVIVE]", string(_obj_amount_max));
                    _obj_text = string_replace(_obj_text, "[EXP_REQUIRED]", string(_objective.exp_amount));
                    break;
                
                case "survive_money":
                    if (_obj_map >= 0)
                    {
                        _obj_text = "Survive " + string(_obj_amount_max) + " times " + _text_map + " with at least " + string(_objective.money_amount) + " roubles made";
                        _obj_text = language_get_string("Quest objective type: Survive Money A");
                        _obj_text = string_replace(_obj_text, "[MAP_NAME]", __map_get_name(_obj_map));
                    }
                    else
                    {
                        _obj_text = language_get_string("Quest objective type: Survive Money B");
                    }
                    
                    _obj_text = string_replace(_obj_text, "[AMOUNT_TO_SURVIVE]", string(_obj_amount_max));
                    _obj_text = string_replace(_obj_text, "[MONEY_REQUIRED]", string(_objective.money_amount));
                    break;
                
                case "retrieve_analyzer":
                    var _anomaly_type_text = "";
                    var _anomaly_type = _objective.anomaly_generator_id;
                    
                    switch (_anomaly_type)
                    {
                        case UnknownEnum.Value_11:
                            _obj_text = language_get_string("Quest objective type: Retrieve Analyzer A");
                            break;
                        
                        case UnknownEnum.Value_12:
                            _obj_text = language_get_string("Quest objective type: Retrieve Analyzer B");
                            break;
                        
                        case UnknownEnum.Value_15:
                            _obj_text = language_get_string("Quest objective type: Retrieve Analyzer C");
                            break;
                        
                        case UnknownEnum.Value_14:
                            _obj_text = language_get_string("Quest objective type: Retrieve Analyzer D");
                            break;
                        
                        default:
                            trace_error("Anomaly type ", _anomaly_type, " not recognised");
                            break;
                    }
                    
                    _obj_text = string_replace(_obj_text, "[MAP_NAME]", __map_get_name(_obj_map));
                    break;
                
                case "place_analyzer":
                    var _anomaly_type_text = "";
                    var _anomaly_type = _objective.anomaly_generator_id;
                    
                    switch (_anomaly_type)
                    {
                        case UnknownEnum.Value_11:
                            _obj_text = language_get_string("Quest objective type: Place Analyzer A");
                            break;
                        
                        case UnknownEnum.Value_12:
                            _obj_text = language_get_string("Quest objective type: Place Analyzer B");
                            break;
                        
                        case UnknownEnum.Value_15:
                            _obj_text = language_get_string("Quest objective type: Place Analyzer C");
                            break;
                        
                        case UnknownEnum.Value_14:
                            _obj_text = language_get_string("Quest objective type: Place Analyzer D");
                            break;
                        
                        default:
                            trace_error("Anomaly type ", _anomaly_type, " not recognised");
                            break;
                    }
                    
                    _obj_text = string_replace(_obj_text, "[MAP_NAME]", __map_get_name(_obj_map));
                    break;
                
                case "retrieve_equipment":
                    _obj_text = language_get_string("Quest objective type: Retrieve Equipment");
                    _obj_text = string_replace(_obj_text, "[MAP_NAME]", __map_get_name(_obj_map));
                    break;
                
                default:
                    _obj_text = language_get_string(_obj_text);
                    break;
            }
            
            _obj_text = string_replace_all(_obj_text, "  ", " ");
            _total_text += ("- " + _obj_text);
            
            if (_quest_state_proper != undefined)
                _total_text += (" (" + _progress + ")");
            
            _total_text += "\n";
            _i++;
        }
    }
    
    return _total_text;
}

enum UnknownEnum
{
    Value_11 = 11,
    Value_12,
    Value_14 = 14,
    Value_15
}
