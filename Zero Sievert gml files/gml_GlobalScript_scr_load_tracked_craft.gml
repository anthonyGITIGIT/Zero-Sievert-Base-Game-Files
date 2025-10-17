function scr_load_tracked_craft()
{
    item_tracking_reset();
    db_open("general");
    
    for (var m = 0; m < global.last_stastic_craft; m++)
        global.craft_track[m] = db_read("Track items", "craft_" + string(m), false);
    
    db_close();
}
