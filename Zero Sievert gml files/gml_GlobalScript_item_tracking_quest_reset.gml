function item_tracking_quest_reset()
{
    var _i = 0;
    
    repeat (30)
    {
        var _quest_id = global.quest_state[_i].id;
        
        if (_quest_id != "")
        {
            var _quest_data = variable_struct_get(global.quest_database, _quest_id);
            
            if (is_undefined(_quest_data))
            {
                global.quest_state[_i] = new class_quest_state();
                continue;
            }
            
            var _quest_objective_array = _quest_data.objective;
            var _j = 0;
            
            repeat (array_length(_quest_objective_array))
            {
                var _objective_data = _quest_objective_array[_j];
                var _objective_type = _objective_data.type;
                
                if (_objective_type == "collect" || _objective_type == "retrieve_analyzer" || _objective_type == "retrieve" || _objective_type == "retrieve_equipment")
                {
                    if (!variable_struct_exists(global.item_tracking_dict, _objective_data.item))
                    {
                        variable_struct_set(global.item_tracking_dict, _objective_data.item, []);
                        array_push(variable_struct_get(global.item_tracking_dict, _objective_data.item), new class_tracking_item_quest(_quest_id, _objective_data.item, _objective_data.amount_max));
                    }
                    else
                    {
                        array_push(variable_struct_get(global.item_tracking_dict, _objective_data.item), new class_tracking_item_quest(_quest_id, _objective_data.item, _objective_data.amount_max));
                    }
                }
                
                _j++;
            }
        }
        
        _i++;
    }
}
