function ui_stash_populate(arg0)
{
    if (!player_exists_local())
        exit;
    
    ui_stash_close();
    var _loot_name = language_get_string("Stash") + " " + string(arg0 + 1);
    
    if (stash_get_sprite_index(arg0) != 0)
        _loot_name = language_get_string(stash_get_name(global.stash_sprite[arg0]));
    
    with (uiGetData())
    {
        loot_name = _loot_name;
        stash_page = arg0;
        stash_sprite_array = undefined;
        stash_page_index = 0;
    }
    
    var _loot_array = db_read_ext("chest", "chest_" + string(arg0), "items", []);
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        ui_convert_loot_to_element(_loot_array[_i], class_ui_item, "other inventory");
        _i++;
    }
}
