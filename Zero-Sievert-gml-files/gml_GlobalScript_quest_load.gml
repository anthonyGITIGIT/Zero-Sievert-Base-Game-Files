function quest_load()
{
    db_open("general");
    init_quest_state();
    
    for (var i = 0; i < 30; i++)
        global.quest_state[i] = SnapDeepCopy(db_read("quest", i, new class_quest_state()));
    
    global.quest_line_progress = SnapDeepCopy(db_read("quest line", "completed", {}));
    global.save_daily_quest = SnapDeepCopy(db_read("daily quests", "generated", undefined));
    
    for (var i = 0; i < array_length(global.save_daily_quest); i++)
    {
        var _id = "daily_quest_" + string(i);
        variable_struct_remove(global.quest_database, _id);
    }
    
    for (var i = 0; i < array_length(global.save_daily_quest); i++)
    {
        var _struct = global.save_daily_quest[i];
        var _id = "daily_quest_" + string(i);
        
        if (is_struct(_struct))
            variable_struct_set(global.quest_database, _id, _struct);
    }
    
    db_close(true);
    trace("Quests loaded");
    item_tracking_reset();
    
    if (global.Quest_Load_Version_Has_Changed)
    {
        global.Quest_Load_Version_Has_Changed = false;
        
        for (var i = 0; i < 30; i++)
        {
            var _quest_id = global.quest_state[i].id;
            
            if (_quest_id != "")
            {
                var _is_daily_quest = is_string(_quest_id) && string_copy(_quest_id, 1, 12) == "daily_quest_";
                
                if (_is_daily_quest)
                {
                    for (var j = 0; j < array_length(variable_struct_get(global.quest_database, _quest_id).objective); j++)
                        global.quest_state[i].amount_now[j] = variable_struct_get(global.quest_database, _quest_id).objective[j].amount_max;
                }
            }
        }
    }
}
