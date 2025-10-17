function skills_load()
{
    skills_reset();
    db_open("general");
    var quante_skill = array_length_1d(global.sk_id);
    
    for (var i = 0; i < quante_skill; i++)
    {
        var iid = global.sk_id[i];
        global.sk_lvl[iid] = db_read("skill", string(iid), global.sk_lvl[iid]);
        global.sk_last_level[i] = db_read("skill last level", string(iid), -1);
    }
    
    db_close();
}
