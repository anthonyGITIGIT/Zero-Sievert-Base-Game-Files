function scr_load_quest()
{
    db_open("general");
    
    for (var i = 0; i < 30; i++)
    {
        global.save_quest_id[i] = db_read("Quest", string(i) + "_id", -1);
        global.save_quest_reward[i] = db_read("Quest", string(i) + "_reward", -1);
        global.save_quest_giver[i] = db_read("Quest", string(i) + "_giver", 0);
        global.save_quest_status[i] = db_read("Quest", string(i) + "_status", 0);
        global.save_quest_notifica[i] = db_read("Quest", string(i) + "_notifica", false);
        
        if (global.save_quest_id[i] != -1)
        {
            for (var j = 0; j < 7; j++)
            {
                global.save_quest_amount_now[i][j] = db_read("Quest", string(i) + "_amount_now_" + string(j), 0);
                global.save_sub_quest_notifica[i][j] = db_read("Quest", string(i) + "_notifica_sub_" + string(j), false);
            }
        }
    }
    
    db_close();
}
