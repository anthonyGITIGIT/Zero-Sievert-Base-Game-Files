function scr_increase_storage_slot(arg0)
{
    var _amount = arg0;
    global.storage_slot_unlocked += _amount;
    db_open("chest");
    db_write("Storage", "slot now", global.storage_slot_unlocked);
    db_close();
}
