function mm_init_slot_metadata()
{
    play_time = array_create(3, undefined);
    most_recent_save = undefined;
    var _highest_timestamp = 0;
    var _i = 0;
    
    repeat (3)
    {
        db_set_filename("shared", "save_shared_" + string(_i + 1) + ".dat");
        db_load("general");
        db_open("general");
        
        if (db_key_exists("Real time played", "seconds"))
            play_time[_i] = db_read("Real time played", "seconds", 1);
        
        db_close();
        var _timestamp = db_meta_read("general", "timestamp", 0);
        
        if (_timestamp > _highest_timestamp)
        {
            most_recent_save = _i + 1;
            _highest_timestamp = _timestamp;
        }
        
        _i++;
    }
    
    if (most_recent_save == undefined)
        trace("Main Menu: No recent save found");
    else
        trace("Main Menu: Most recent save is slot ", most_recent_save);
    
    scr_aggiorna_save_slot(global.slot_selected);
}
