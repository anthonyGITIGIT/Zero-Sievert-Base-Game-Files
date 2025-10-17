function scr_save_skill_and_base()
{
    db_open("general");
    var quante_skill = array_length_1d(global.sk_id);
    
    for (var i = 0; i < quante_skill; i++)
    {
        var iid = global.sk_id[i];
        db_write("skill", string(iid), global.sk_lvl[iid]);
        db_write("skill last level", string(iid), floor(global.sk_lvl[iid]));
    }
    
    for (var i = 0; i < array_length_1d(global.base_id); i++)
    {
        var get_id = global.base_id[i];
        db_write("Base", string(get_id), global.base_lvl[get_id]);
    }
    
    for (var i = 0; i < array_length_1d(global.sl_id); i++)
    {
        var get_id = global.sl_id[i];
        db_write("Base slot", string(get_id), global.sl_base_id[get_id]);
        db_write("Base slot occupato", string(get_id), global.sl_free[get_id]);
    }
    
    db_close();
}
