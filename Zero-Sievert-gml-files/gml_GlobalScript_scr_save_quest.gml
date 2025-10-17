function scr_save_quest()
{
    db_open("general");
    
    for (var i = 0; i < 30; i++)
    {
        db_write("Quest", string(i) + "_id", global.save_quest_id[i]);
        db_write("Quest", string(i) + "_status", global.save_quest_status[i]);
        db_write("Quest", string(i) + "_reward", global.save_quest_reward[i]);
        db_write("Quest", string(i) + "_giver", global.save_quest_giver[i]);
        db_write("Quest", string(i) + "_notifica", global.save_quest_notifica[i]);
        db_key_delete("Quest", string(i) + "_amount_now");
        
        if (global.save_quest_id[i] != -1)
        {
            for (var j = 0; j < 7; j++)
            {
                db_write("Quest", string(i) + "_amount_now_" + string(j), global.save_quest_amount_now[i][j]);
                db_write("Quest", string(i) + "_notifica_sub_" + string(j), global.save_sub_quest_notifica[i][j]);
            }
        }
    }
    
    db_close();
}
