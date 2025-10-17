function ui_stash_is_open()
{
    var _index = struct_get_from_hash(uiGetData(), variable_get_hash("stash_page"));
    return _index != undefined;
}
