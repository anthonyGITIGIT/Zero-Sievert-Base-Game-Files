function loot_action_scrap_now(arg0)
{
    var _scrap_type = item_get_scrap(arg0.item);
    
    if (_scrap_type == "none")
        exit;
    
    inventory_write_to_db();
    var _quantity = clamp(scrap_get_quantity(_scrap_type, arg0), 1, 999);
    
    if (_quantity <= 0)
        exit;
    
    var _scrap_item = scrap_get_item(_scrap_type);
    
    if (!inventory_check_for_space(_scrap_item, _quantity))
    {
        scr_draw_text_with_box("Not enough inventory space to scrap this item");
        exit;
    }
    
    loot_decrement(arg0, infinity);
    inventory_add_item(_scrap_item, _quantity);
    ui_inventory_check_weight();
}
