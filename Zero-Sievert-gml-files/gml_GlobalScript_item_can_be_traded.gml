function item_can_be_traded(arg0)
{
    if (!item_get_can_be_sold(arg0))
        return false;
    
    if (!item_get_quest_item(arg0))
        return true;
    
    for (var j = 0; j < 30; j++)
    {
        var _quest_active_id = global.quest_state[j].id;
        
        if (_quest_active_id != "")
        {
            for (var k = 0; k < array_length(variable_struct_get(global.quest_database, _quest_active_id).objective); k++)
            {
                var _quest_item_id = "no_item";
                var _objective_struct = variable_struct_get(global.quest_database, _quest_active_id).objective[k];
                
                switch (_objective_struct.type)
                {
                    case "collect":
                    case "retrieve_analyzer":
                    case "retrieve":
                    case "retrieve_equipment":
                        _quest_item_id = _objective_struct.item;
                        break;
                    
                    case "interact_obj":
                    case "place_analyzer":
                        _quest_item_id = _objective_struct.item_id;
                        break;
                }
                
                if (_quest_item_id == arg0)
                    return false;
            }
        }
    }
    
    return true;
}
