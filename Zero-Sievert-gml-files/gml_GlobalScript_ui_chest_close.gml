function ui_chest_close()
{
    if (!uiGetData().chest_using)
        exit;
    
    var _target;
    
    with (uiGetData())
    {
        _target = chest_target;
        chest_using = false;
        chest_target = undefined;
    }
    
    var _root = uiLayerGetRoot("inventory layer");
    var _loot_ui_array = uiFindAllType(_root, "class_ui_item");
    var _output_loot_array = [];
    var _i = 0;
    
    repeat (array_length(_loot_ui_array))
    {
        var _loot_ui = _loot_ui_array[_i];
        
        if (_loot_ui.Get("parent").identifier == "other inventory")
        {
            var _loot = ui_convert_element_to_loot(_loot_ui);
            array_push(_output_loot_array, _loot);
        }
        
        _i++;
    }
    
    if (array_length(_output_loot_array) <= 0)
    {
        if (_target != undefined)
        {
            var _chest_name = "chest_" + string(_target.id);
            db_open("all loot");
            db_section_delete(_chest_name);
            db_close();
            
            if (chest_get_destroy_when_empty(_target.tipo))
            {
                with (_target)
                    instance_destroy();
            }
        }
    }
    else
    {
        if (_target == undefined)
        {
            var _player = player_get_local();
            
            if (!instance_exists(_player))
            {
                exit;
            }
            else
            {
                _target = instance_create_depth(_player.x, _player.y, -_player.y, obj_chest_general);
                _target.tipo = "discard";
            }
        }
        
        db_open("all loot");
        var _chest_name = "chest_" + string(_target.id);
        db_write(_chest_name, "chest_x", _target.x);
        db_write(_chest_name, "chest_y", _target.y);
        db_write(_chest_name, "items", _output_loot_array);
        db_close();
    }
}
