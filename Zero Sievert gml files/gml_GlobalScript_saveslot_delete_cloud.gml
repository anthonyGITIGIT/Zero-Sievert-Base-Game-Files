function saveslot_delete_cloud()
{
    var _index = 1;
    
    repeat (3)
    {
        db_cloud_wipe("save_shared_" + string(_index) + ".dat");
        _index++;
    }
    
    db_unload("general");
    
    with (obj_main_menu)
    {
        mm_init_slot_metadata();
        uiGetData().most_recent_save = most_recent_save;
    }
}
