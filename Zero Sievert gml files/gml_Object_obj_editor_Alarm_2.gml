if (instance_exists(obj_editor_launcher))
{
    var _rooms_array = tag_get_asset_ids("building template", 3);
    array_sort(_rooms_array, true);
    var _index = array_find_index(_rooms_array, room);
    _index++;
    
    if (_index < array_length(_rooms_array))
    {
        room_goto(_rooms_array[_index]);
        exit;
    }
    
    show_message("Export complete!");
    game_end();
}
