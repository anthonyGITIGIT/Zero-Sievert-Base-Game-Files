function item_tracked_get_track_quest_id(arg0, arg1)
{
    var _array = item_tracked_get_array(arg0);
    show_debug_message("here quest" + _array[arg1].questid);
    return _array[arg1].questid;
}
