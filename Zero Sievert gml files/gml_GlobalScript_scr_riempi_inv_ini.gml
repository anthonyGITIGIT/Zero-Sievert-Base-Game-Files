function scr_riempi_inv_ini()
{
    var grid_w = 8;
    var grid_h = 11;
    var grid_item_ = ds_grid_create(grid_w, grid_h);
    ds_grid_clear(grid_item_, false);
    db_open(inventory_target_db());
    var _loot_array = db_read("Inventory", "items", []);
    db_close();
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        
        if (_loot.quantity > 0)
        {
            var _sprite = item_get_sprite_inv(_loot.item);
            var item_gridx = ((_loot.x - 41) + 1) div 16;
            var item_gridy = ((_loot.y - 63) + 1) div 16;
            var necessario_w = sprite_get_width(_sprite) div 16;
            var necessario_h = sprite_get_height(_sprite) div 16;
            var prov_h = 0;
            
            if (_loot.rotation == 90)
            {
                necessario_w = sprite_get_height(_sprite) div 16;
                necessario_h = sprite_get_width(_sprite) div 16;
                prov_h = -necessario_h;
            }
            
            ds_grid_set_region(grid_item_, item_gridx, item_gridy + prov_h, (item_gridx + necessario_w) - 1, (item_gridy + prov_h + necessario_h) - 1, true);
        }
        
        _i++;
    }
    
    return grid_item_;
}
