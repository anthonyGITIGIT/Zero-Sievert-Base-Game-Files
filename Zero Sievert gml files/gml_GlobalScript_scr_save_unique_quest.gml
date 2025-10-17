function scr_save_unique_quest()
{
    db_open("general");
    
    for (var i = 0; i < array_length_1d(global.quest_id); i++)
    {
        var q_id = global.quest_id[i];
        
        if (global.quest_unique_done[global.quest_id[i]] == true)
            db_write("quest_" + string(q_id), "Already_done", true);
    }
    
    db_close();
}
