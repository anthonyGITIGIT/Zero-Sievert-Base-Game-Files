function scr_load_unique_quest()
{
    db_open("general");
    var o = obj_controller;
    
    for (var i = 0; i < array_length_1d(global.quest_id); i++)
    {
        var q_id = global.quest_id[i];
        
        if (global.quest_is_unique[q_id] == true)
            global.quest_unique_done[q_id] = db_read("quest_" + string(q_id), "Already_done", false);
    }
    
    db_close();
}
