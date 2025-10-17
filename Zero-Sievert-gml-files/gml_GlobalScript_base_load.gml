function base_load()
{
    db_open("general");
    
    for (var i = 0; i < array_length_1d(global.base_id); i++)
    {
        var get_id = global.base_id[i];
        var k = 0;
        
        if (get_id == UnknownEnum.Value_2)
            k = 0;
        
        global.base_lvl[get_id] = db_read("Base", string(get_id), k);
    }
    
    for (var i = 0; i < array_length_1d(global.sl_id); i++)
    {
        var get_id = global.sl_id[i];
        var k = -1;
        var kk = 0;
        
        if (get_id == UnknownEnum.Value_0)
        {
            k = UnknownEnum.Value_2;
            kk = 2;
        }
        
        global.sl_base_id[get_id] = db_read("Base slot", string(get_id), k);
        global.sl_free[get_id] = db_read("Base slot occupato", string(get_id), kk);
    }
    
    db_close();
}

enum UnknownEnum
{
    Value_0,
    Value_2 = 2
}
