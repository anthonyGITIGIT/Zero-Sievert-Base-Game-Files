function trader_inventory_add_new(arg0, arg1, arg2, arg3, arg4)
{
    with (arg0)
    {
        var _position = arg4.TryPlace(arg1);
        
        if (is_struct(_position))
        {
            var _page = item_get_trader_page(arg1);
            var _loot = new class_loot(arg1, arg2, 16 * _position.x, 16 * _position.y, 0, "other inventory");
            loot_set_from_trader(_loot, arg3, _page);
            arg4.Place(_position.x, _position.y, _loot);
            array_push(loot_array, _loot);
            
            if (__uiGlobal().__defaultOnion.LayerExists("inventory layer") && uiGetData().trader_page == _page)
                ui_convert_loot_to_element(_loot, class_ui_loot_trader, "other inventory");
        }
    }
}
