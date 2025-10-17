function ui_trader_is_open()
{
    var _index = struct_get_from_hash(uiGetData(), variable_get_hash("trader_target"));
    return _index != undefined;
}
