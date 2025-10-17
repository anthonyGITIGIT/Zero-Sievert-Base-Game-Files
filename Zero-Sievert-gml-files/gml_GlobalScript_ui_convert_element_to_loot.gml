function ui_convert_element_to_loot(arg0)
{
    var _loot = arg0.__lootStruct;
    _loot.x = arg0.Get("left") / 4;
    _loot.y = arg0.Get("top") / 4;
    return _loot;
}
