function class_loot_grid(arg0, arg1) constructor
{
    static Destroy = function()
    {
        if (__destroyed)
            exit;
        
        __destroyed = true;
        ds_grid_destroy(__grid_loot);
        __grid_loot = undefined;
        ds_grid_destroy(__grid_free);
        __grid_free = undefined;
    };
    
    static Clear = function()
    {
        ds_grid_clear(__grid_loot, undefined);
        ds_grid_clear(__grid_free, 0);
    };
    
    static TryPlace = function(arg0)
    {
        if (__destroyed)
            exit;
        
        var _item_width = sprite_get_width(item_get_sprite_inv(arg0)) div 16;
        var _item_height = sprite_get_height(item_get_sprite_inv(arg0)) div 16;
        var _grid_width = ds_grid_width(__grid_free);
        var _grid_height = ds_grid_height(__grid_free);
        
        for (var _y = 0; _y < ((1 + _grid_height) - _item_height); _y++)
        {
            for (var _x = 0; _x < ((1 + _grid_width) - _item_width); _x++)
            {
                if (ds_grid_get_max(__grid_free, _x, _y, (_x + _item_width) - 1, (_y + _item_height) - 1) == 0)
                {
                    return 
                    {
                        x: _x,
                        y: _y,
                        rot: 0
                    };
                }
            }
        }
        
        for (var _y = 0; _y < ((1 + _grid_height) - _item_width); _y++)
        {
            for (var _x = 0; _x < ((1 + _grid_width) - _item_height); _x++)
            {
                if (ds_grid_get_max(__grid_free, _x, _y, (_x + _item_height) - 1, _y + (_item_width - 1)) == 0)
                {
                    return 
                    {
                        x: _x,
                        y: _y,
                        rot: 90
                    };
                }
            }
        }
    };
    
    static TryPlaceFromInventoryUI = function(arg0)
    {
        var _child_array = arg0.__children;
        var _i = 0;
        
        repeat (array_length(_child_array))
        {
            var _loot = _child_array[_i].__lootStruct;
            var _position = TryPlace(_loot.item);
            
            if (_position == undefined)
                return false;
            
            Place(_position.x, _position.y, _loot);
            _i++;
        }
        
        return true;
    };
    
    static Place = function(arg0, arg1, arg2)
    {
        if (__destroyed)
            exit;
        
        var _item_width = sprite_get_width(item_get_sprite_inv(arg2.item)) div 16;
        var _item_height = sprite_get_height(item_get_sprite_inv(arg2.item)) div 16;
        ds_grid_set_region(__grid_loot, arg0, arg1, (arg0 + _item_width) - 1, (arg1 + _item_height) - 1, arg2);
        ds_grid_set_region(__grid_free, arg0, arg1, (arg0 + _item_width) - 1, (arg1 + _item_height) - 1, 1);
    };
    
    static PlaceFromInventoryLootArray = function(arg0, arg1 = undefined)
    {
        var _i = 0;
        
        repeat (array_length(arg0))
        {
            var _loot = arg0[_i];
            
            if (_loot.quantity > 0 && (arg1 == undefined || _loot.placement == arg1))
            {
                var _sprite = item_get_sprite_inv(_loot.item);
                var item_gridx = (_loot.x + 1) div 16;
                var item_gridy = (_loot.y + 1) div 16;
                var necessario_w = sprite_get_width(_sprite) div 16;
                var necessario_h = sprite_get_height(_sprite) div 16;
                var prov_h = 0;
                
                if (_loot.rotation == 90)
                {
                    necessario_w = sprite_get_height(_sprite) div 16;
                    necessario_h = sprite_get_width(_sprite) div 16;
                    prov_h = -necessario_h;
                }
                
                ds_grid_set_region(__grid_loot, item_gridx, item_gridy, (item_gridx + necessario_w) - 1, (item_gridy + necessario_h) - 1, _loot);
                ds_grid_set_region(__grid_free, item_gridx, item_gridy, (item_gridx + necessario_w) - 1, (item_gridy + necessario_h) - 1, 1);
            }
            
            _i++;
        }
    };
    
    static PlaceFromTraderLootArray = function(arg0, arg1, arg2 = undefined)
    {
        if (arg1 == undefined)
        {
            PlaceFromInventoryLootArray(arg0, arg2);
            exit;
        }
        
        var _new_loot_array = [];
        var _i = 0;
        
        repeat (array_length(arg0))
        {
            var _loot = arg0[_i];
            
            if (_loot.page == arg1)
                array_push(_new_loot_array, _loot);
            
            _i++;
        }
        
        PlaceFromInventoryLootArray(_new_loot_array, arg2);
    };
    
    static PlaceFromInventoryUI = function(arg0)
    {
        var _child_array = arg0.__children;
        var _size = array_length(_child_array);
        var _loot_array = array_create(_size, undefined);
        var _i = 0;
        
        repeat (_size)
        {
            _loot_array[_i] = _child_array[_i].__lootStruct;
            _i++;
        }
        
        PlaceFromInventoryLootArray(_loot_array, "player inventory");
        return true;
    };
    
    __grid_loot = ds_grid_create(arg0, arg1);
    __grid_free = ds_grid_create(arg0, arg1);
    Clear();
    __destroyed = false;
}
