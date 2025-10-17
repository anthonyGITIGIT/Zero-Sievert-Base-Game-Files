alarm[1] = 120;

for (var j = 0; j < 30; j++)
{
    var quest_id_ = global.quest_state[j].id;
    
    if (quest_id_ != "")
    {
        for (var i = 0; i < array_length(variable_struct_get(global.quest_database, quest_id_).objective); i++)
        {
            switch (variable_struct_get(global.quest_database, quest_id_).objective[i].type)
            {
                case "collect":
                    if (is_undefined(struct_get_from_hash(array_get(global.quest_state, j), variable_get_hash("amount_max"))))
                    {
                        global.quest_state[j].amount_max = array_create(array_length(global.quest_state[j].amount_now));
                        
                        for (var t = 0; t < array_length(global.quest_state[j].amount_max); t++)
                            global.quest_state[j].amount_max[t] = 1;
                    }
                    
                    global.quest_state[j].amount_now[i] = 0;
                    break;
                
                case "collect_weapon":
                    global.quest_state[j].amount_now[i] = 0;
                    break;
                
                case "retrieve":
                    global.quest_state[j].amount_now[i] = 0;
                    break;
                
                case "retrieve_analyzer":
                    global.quest_state[j].amount_now[i] = 0;
                    break;
                
                case "retrieve_equipment":
                    global.quest_state[j].amount_now[i] = 0;
                    break;
            }
        }
    }
}

db_open(inventory_target_db());
var _loot_array = db_read("Inventory", "items", []);
db_close();

for (var i = 0; i < array_length(_loot_array); i++)
{
    var temp_item_id = _loot_array[i].item;
    var temp_item_qnt = _loot_array[i].quantity;
    
    for (var j = 0; j < 30; j++)
    {
        var quest_id_ = global.quest_state[j].id;
        
        if (quest_id_ != "")
        {
            for (var k = 0; k < array_length(variable_struct_get(global.quest_database, quest_id_).objective); k++)
            {
                switch (variable_struct_get(global.quest_database, quest_id_).objective[k].type)
                {
                    case "collect":
                        if (temp_item_id == variable_struct_get(global.quest_database, quest_id_).objective[k].item)
                        {
                            repeat (temp_item_qnt)
                                global.quest_state[j].amount_now[k] += 1;
                        }
                        
                        break;
                    
                    case "collect_weapon":
                        if (temp_item_id == variable_struct_get(global.quest_database, quest_id_).objective[k].item)
                        {
                            repeat (temp_item_qnt)
                                global.quest_state[j].amount_now[k] += 1;
                        }
                        
                        break;
                    
                    case "retrieve":
                        if (temp_item_id == variable_struct_get(global.quest_database, quest_id_).objective[k].item)
                            global.quest_state[j].amount_now[k] = 1;
                        
                        break;
                    
                    case "retrieve_analyzer":
                        if (temp_item_id == variable_struct_get(global.quest_database, quest_id_).objective[k].item)
                            global.quest_state[j].amount_now[k] = 1;
                        
                        break;
                    
                    case "retrieve_equipment":
                        if (temp_item_id == variable_struct_get(global.quest_database, quest_id_).objective[k].item)
                            global.quest_state[j].amount_now[k] = 1;
                        
                        break;
                }
            }
        }
    }
}

for (var k = 0; k < global.storage_slot_unlocked; k++)
{
    _loot_array = db_read_ext("chest", "chest_" + string(k), "items", []);
    
    for (var i = 0; i < array_length(_loot_array); i++)
    {
        var temp_item_id = _loot_array[i].item;
        var temp_item_qnt = _loot_array[i].quantity;
        
        for (var j = 0; j < 30; j++)
        {
            var quest_id_ = global.quest_state[j].id;
            
            if (quest_id_ != "")
            {
                for (var p = 0; p < array_length(variable_struct_get(global.quest_database, quest_id_).objective); p++)
                {
                    switch (variable_struct_get(global.quest_database, quest_id_).objective[p].type)
                    {
                        case "collect":
                            if (temp_item_id == variable_struct_get(global.quest_database, quest_id_).objective[p].item)
                            {
                                repeat (temp_item_qnt)
                                    global.quest_state[j].amount_now[p] += 1;
                            }
                            
                            break;
                        
                        case "collect_weapon":
                            if (temp_item_id == variable_struct_get(global.quest_database, quest_id_).objective[p].item)
                            {
                                repeat (temp_item_qnt)
                                    global.quest_state[j].amount_now[p] += 1;
                            }
                            
                            break;
                        
                        case "retrieve":
                            if (temp_item_id == variable_struct_get(global.quest_database, quest_id_).objective[p].item)
                                global.quest_state[j].amount_now[p] = 1;
                            
                            break;
                        
                        case "retrieve_analyzer":
                            if (temp_item_id == variable_struct_get(global.quest_database, quest_id_).objective[p].item)
                                global.quest_state[j].amount_now[p] = 1;
                            
                            break;
                        
                        case "retrieve_equipment":
                            if (temp_item_id == variable_struct_get(global.quest_database, quest_id_).objective[p].item)
                                global.quest_state[j].amount_now[p] = 1;
                            
                            break;
                    }
                }
            }
        }
    }
}

for (var j = 0; j < 30; j++)
{
    var quest_id_ = global.quest_state[j].id;
    
    if (quest_id_ != "")
    {
        if (global.quest_state[j].state == "active")
        {
            if (quest_id_ == "old_man")
            {
                if (global.az_done[UnknownEnum.Value_1] == true)
                {
                    global.quest_state[j].amount_now[0] = 1;
                    global.quest_state[j].state = "completed";
                }
            }
        }
    }
}

quest_check_state();

for (var j = 0; j < 30; j++)
{
    var quest_id_ = global.quest_state[j].id;
    
    if (quest_id_ != "")
    {
        for (var k = 0; k < array_length(variable_struct_get(global.quest_database, quest_id_).objective); k++)
            global.quest_state[j].amount_now[k] = clamp(global.quest_state[j].amount_now[k], 0, variable_struct_get(global.quest_database, quest_id_).objective[k].amount_max);
    }
}

enum UnknownEnum
{
    Value_1 = 1
}
