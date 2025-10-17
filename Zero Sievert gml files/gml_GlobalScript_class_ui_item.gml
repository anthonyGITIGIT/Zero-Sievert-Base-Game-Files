global.Dragging_Loot_Struct = undefined;

function class_ui_item() : uiClassDnD() constructor
{
    static __TooltipShow = function()
    {
        uiGetData().tooltip_loot = __lootStruct;
        uiGetData().tooltip_open = true;
        __uiGlobal().__defaultOnion.TooltipEnsureOver("ZS_vanilla/ui/tooltip_item.ui", "tooltip", uiOnionCurrentLayer());
    };
    
    static __SetRotatedSize = function(arg0)
    {
        var _sprite = item_get_sprite_inv(__lootStruct.item);
        var _width = 4 * (sprite_get_width(_sprite) - 1);
        var _height = 4 * (sprite_get_height(_sprite) - 1);
        
        if (arg0 == 0)
        {
            Set("width", _width);
            Set("height", _height);
        }
        else
        {
            Set("width", _height);
            Set("height", _width);
        }
    };
    
    __searchTimer = 0;
    __dragRotation = undefined;
    __lootStruct = undefined;
    __tooltipTimer = 20;
    __quickMove = false;
    focusable = false;
    Set("captureClick", ["action", "alt", "gamepad tooltip", "quick move"]);
    VariableBind("loot", function()
    {
        return __lootStruct;
    }, function(arg0)
    {
        __lootStruct = arg0;
        var _sprite = item_get_sprite_inv(__lootStruct.item);
        
        if (__lootStruct.rotation == 0)
            Set("ltrb", [4 * __lootStruct.x, 4 * __lootStruct.y, 4 * ((__lootStruct.x + sprite_get_width(_sprite)) - 1), 4 * ((__lootStruct.y + sprite_get_height(_sprite)) - 1)]);
        else
            Set("ltrb", [4 * __lootStruct.x, 4 * __lootStruct.y, 4 * ((__lootStruct.x + sprite_get_height(_sprite)) - 1), 4 * ((__lootStruct.y + sprite_get_width(_sprite)) - 1)]);
    });
    CallbackSetParentChanged(function(arg0, arg1)
    {
        if (is_struct(arg0))
            hoverGroup = arg0.hoverGroup;
        else
            hoverGroup = undefined;
    });
    CallbackSetHover(function()
    {
        uiCallInherited();
        
        if (__uiGlobal().__defaultOnion.InputGetMode() == "pointer")
        {
            if (loot_get_seen(__lootStruct))
            {
                if (__tooltipTimer > 0)
                    __tooltipTimer--;
                else if (!GetButton("action") && !GetButton("alt"))
                    __TooltipShow();
            }
        }
    });
    CallbackSetHoverEnd(function()
    {
        uiCallInherited();
        
        if (__uiGlobal().__defaultOnion.InputGetMode() == "pointer")
            __tooltipTimer = 20;
    });
    CallbackSetCanHover(function()
    {
        return !GetAnyDragging();
    });
    CallbackSetButtonStart(function(arg0)
    {
        if (!loot_get_seen(__lootStruct))
            exit;
        
        global.Dragging_Loot_Struct = self;
        
        if (__uiGlobal().__defaultOnion.InputGetMode() == "pointer")
        {
            __quickMove = keyboard_check(vk_control);
            
            if (__quickMove)
                quick_move_sort();
            else
                uiCallInherited();
        }
        else
        {
            if (ui_is_trading() && !obj_gamepad.last_input_keyboard)
            {
                __quickMove = ui_is_trading() || (!obj_gamepad.last_input_keyboard && (obj_gamepad.action[UnknownEnum.Value_30].pressed || obj_gamepad.action[UnknownEnum.Value_6].pressed));
            }
            else
            {
                __quickMove = ui_is_trading() || (!obj_gamepad.last_input_keyboard && obj_gamepad.action[UnknownEnum.Value_30].pressed);
                
                if (ui_is_trading() && !obj_gamepad.last_input_keyboard)
                {
                    if (!obj_gamepad.action[UnknownEnum.Value_30].pressed || !obj_gamepad.action[UnknownEnum.Value_6].pressed)
                        __quickMove = false;
                    
                    if (obj_gamepad.action[UnknownEnum.Value_6].pressed)
                        __quickMove = true;
                }
            }
            
            if (__quickMove)
            {
                if (ui_is_trading() && !obj_gamepad.last_input_keyboard)
                {
                }
                else
                {
                    quick_move_sort();
                }
                
                if (!obj_gamepad.last_input_keyboard)
                    __quickMove = false;
            }
            else
            {
                if (arg0 == "action")
                    focusable = true;
                
                uiCallInherited();
            }
        }
        
        __dragRotation = __lootStruct.rotation;
        __startingRotation = __dragRotation;
    });
    CallbackSetButton(function(arg0)
    {
        uiCallInherited();
        
        if (!loot_get_seen(__lootStruct))
            exit;
        
        if (arg0 == "gamepad tooltip" && __uiGlobal().__defaultOnion.InputGetMode() == "directional")
        {
            __TooltipShow();
        }
        else if (arg0 == "action" && (keyboard_check_released(ord("R")) || obj_gamepad.action[UnknownEnum.Value_29].pressed) && Get("width") != Get("height"))
        {
            __dragRotation = (__dragRotation != 0) ? 0 : 90;
            __SetRotatedSize(__dragRotation);
        }
    });
    CallbackSetButtonClick(function(arg0)
    {
        uiCallInherited();
        
        if (!loot_get_seen(__lootStruct))
            exit;
        
        global.Dragging_Loot_Struct = self;
        
        if (arg0 == "action")
        {
            if (__quickMove || (ui_is_trading() && !obj_gamepad.last_input_keyboard == false))
            {
                __quickMove = true;
                quick_move_sort();
            }
            else
            {
                focusable = true;
            }
            
            if (ui_is_trading())
            {
                __quickMove = true;
            }
            else
            {
            }
        }
        else if (arg0 == "alt")
        {
            if (array_length(loot_action_get_array(__lootStruct)) > 0)
            {
                uiGetData().context_menu_loot = __lootStruct;
                __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/context_menu.ui");
            }
        }
    });
    CallbackSetButtonEnd(function(arg0)
    {
        uiCallInherited();
        
        if (!loot_get_seen(__lootStruct))
            exit;
        
        if (__uiGlobal().__defaultOnion.InputGetMode() == "pointer")
        {
            if (arg0 == "action")
                __uiDraggingSet(__uiRootStackTop(), undefined);
        }
        else if (focusable)
        {
            if (ui_is_trading() && !obj_gamepad.last_input_keyboard)
            {
                if (__quickMove)
                {
                    quick_move_sort();
                    __quickMove = false;
                }
            }
            
            if (arg0 == "action")
                __uiDraggingSet(__uiRootStackTop(), undefined);
            
            focusable = false;
        }
    });
    CallbackSetDnDOnPlace(function(arg0)
    {
        if (arg0 != undefined)
        {
            if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("__highlightCollision"))) || !arg0.__highlightCollision)
            {
                if (array_length(arg0.category) > 0)
                {
                    var _category = item_get_category(__lootStruct.item);
                    
                    if (array_find_index(arg0.category, _category) == undefined)
                        exit;
                }
                
                if (!global.UI_Item_Drag_Skip_Placement_Assignment)
                {
                    if (arg0.GetType() == "class_ui_item_slot")
                        __dragRotation = 0;
                    
                    __lootStruct.rotation = __dragRotation;
                    __lootStruct.placement = arg0.identifier;
                    trace(["Moved item to new placement", arg0.identifier]);
                }
                
                ui_inventory_check_weight();
            }
        }
        
        __SetRotatedSize(__lootStruct.rotation);
    });
    CallbackSet(UnknownEnum.Value_11, function()
    {
        if (!loot_get_seen(__lootStruct))
        {
            var _nextUI = Get("parent").ChildNext(self);
            var _nextLoot = is_struct(_nextUI) ? struct_get_from_hash(_nextUI, variable_get_hash("__lootStruct")) : undefined;
            
            if (loot_get_seen(_nextLoot))
            {
                __searchTimer += (global.sk_k[UnknownEnum.Value_7] + (skill_hunter_obtained("lootgoblin") * struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("lootgoblin")), variable_get_hash("search_rate_increase"))));
                
                if (__searchTimer >= global.svela_item_max)
                    __lootStruct.seen = true;
            }
        }
    });
    CallbackSet(UnknownEnum.Value_12, function()
    {
        var _hoverColour = color;
        var _hoverStruct = GetHoverStruct();
        var _rotation = GetDragging() ? __dragRotation : undefined;
        var _compatHighlight = false;
        
        if (_hoverStruct != self && is_struct(_hoverStruct))
        {
            if (_hoverStruct.GetType() == "class_ui_item" || _hoverStruct.GetType() == "class_ui_loot_trader")
                _compatHighlight = item_is_compatible(loot_get_item(__lootStruct), loot_get_item(_hoverStruct.__lootStruct));
        }
        
        if (!loot_get_seen(__lootStruct))
        {
            var _x = 0.5 * (__drawLeft + __drawRight);
            var _y = 0.5 * (__drawTop + __drawBottom);
            draw_sprite_repeat(s_hud_item_visto, 0, __drawLeft + 1, __drawTop - 1, __drawRight, __drawBottom, 4, 4, 16777215, 1);
            var _search_dec = __searchTimer / 60;
            var _search_per = round(_search_dec * 100);
            var _search_per_str = string(_search_per) + "%";
            var _show_sprite_at = 0.8;
            
            if (_search_dec > (_show_sprite_at - 0.1))
                loot_draw(__lootStruct, __drawLeft, __drawTop, _rotation, 4, color, 0);
            
            if (_search_dec > _show_sprite_at)
            {
                var _alpha_dec = map_value(_search_dec, _show_sprite_at, 1, 0, 1);
                shader_set(shd_loot_seen);
                loot_draw(__lootStruct, __drawLeft, __drawTop, _rotation, 4, color, _alpha_dec);
                shader_reset();
            }
            
            if (__searchTimer > 0)
            {
                var _oldFont = draw_get_font();
                language_set_font(UnknownEnum.Value_4);
                draw_set_halign(fa_center);
                draw_set_valign(fa_middle);
                draw_set_color(c_black);
                draw_text(_x, _y + 8 + 4, _search_per_str);
                draw_set_color(c_white);
                draw_text(_x, _y + 8, _search_per_str);
                draw_set_color(c_white);
                draw_set_halign(fa_left);
                draw_set_valign(fa_top);
                draw_set_font_language(_oldFont);
            }
            
            if (GetButton() || GetHover())
            {
                var _borderColor = merge_color(c_orange, c_white, 0.2);
                draw_set_color(_borderColor);
                draw_set_alpha(1);
                var _x1 = ((__drawLeft div 4) + 1) * 4;
                var _y1 = (__drawTop div 4) * 4;
                var _x2 = ((__drawRight div 4) + 1) * 4;
                var _y2 = ((__drawBottom div 4) + 1) * 4;
                
                for (var _i = 0; _i < 4; _i++)
                    draw_rectangle(_x1 + _i, _y1 + _i, _x2 - _i, _y2 - _i, true);
                
                draw_set_alpha(1);
                draw_set_color(c_white);
            }
        }
        else
        {
            if (!GetDragging())
            {
                draw_set_color(c_white);
                draw_set_alpha(0.2);
                var _x1 = ((__drawLeft div 4) + 1) * 4;
                var _y1 = (__drawTop div 4) * 4;
                var _x2 = ((__drawRight div 4) + 1) * 4;
                var _y2 = (__drawBottom div 4) * 4;
                draw_rectangle(_x1, _y1, _x2, _y2, false);
                draw_set_alpha(1);
            }
            
            if (GetButton() || GetHover())
            {
                var _borderColor = merge_color(c_orange, c_white, 0.2);
                
                if (GetButton())
                    _borderColor = merge_color(_borderColor, c_white, 0.2);
                
                loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, _rotation, 4, _borderColor);
            }
            else if (_compatHighlight)
            {
                _hoverColour = 4317506;
                loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, _rotation, 4, _hoverColour);
            }
            else if (loot_get_category(__lootStruct) == "weapon" && !loot_weapon_can_fire(__lootStruct))
            {
                _hoverColour = 255;
                loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, _rotation, 4, _hoverColour);
            }
            else if (item_is_tracked(loot_get_item(__lootStruct)))
            {
                _hoverColour = 6477526;
                loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, _rotation, 4, _hoverColour);
            }
            else
            {
                loot_draw(__lootStruct, __drawLeft, __drawTop, _rotation, 4, color, alpha);
            }
            
            if (__lootStruct.quantity > 1)
            {
                var _oldFont = draw_get_font();
                language_set_font(UnknownEnum.Value_4);
                draw_set_halign(fa_right);
                draw_set_valign(fa_bottom);
                draw_set_color(c_black);
                draw_text(__drawRight + global.language_font_offset.x, __drawBottom + global.language_font_offset.y + 16 + 4, __lootStruct.quantity);
                draw_set_color(c_white);
                draw_text(__drawRight + global.language_font_offset.x, __drawBottom + global.language_font_offset.y + 16, __lootStruct.quantity);
                draw_set_color(c_white);
                draw_set_halign(fa_left);
                draw_set_valign(fa_top);
                draw_set_font_language(_oldFont);
            }
            
            if (point_in_rectangle(uiPointerGetX(), uiPointerGetY(), 170, 970, 425, 1020))
            {
                var _col = item_overlay_get_color("weight");
                draw_set_color(_col);
                draw_set_alpha(0.3);
                var _x1 = ((__drawLeft div 4) + 1) * 4;
                var _y1 = (__drawTop div 4) * 4;
                var _x2 = ((__drawRight div 4) + 1) * 4;
                var _y2 = (__drawBottom div 4) * 4;
                draw_rectangle(_x1, _y1, _x2, _y2, false);
                draw_set_alpha(1);
            }
            
            if (point_in_rectangle(uiPointerGetX(), uiPointerGetY(), 475, 970, 650, 1020))
            {
                var _col = item_overlay_get_color("value");
                draw_set_color(_col);
                draw_set_alpha(0.3);
                var _x1 = ((__drawLeft div 4) + 1) * 4;
                var _y1 = (__drawTop div 4) * 4;
                var _x2 = ((__drawRight div 4) + 1) * 4;
                var _y2 = (__drawBottom div 4) * 4;
                draw_rectangle(_x1, _y1, _x2, _y2, false);
                draw_set_alpha(1);
            }
        }
    });
    
    function quick_move_sort()
    {
        if (__quickMove)
        {
            var _destination = undefined;
            
            switch (Get("parent").identifier)
            {
                case "player inventory":
                    switch (item_get_category(__lootStruct.item))
                    {
                        case "weapon":
                            _destination = uiFindRelaxed(uiCurrentRoot(), "weapon slot 1");
                            
                            if (_destination != undefined && _destination.AutoPlace(self))
                            {
                                ui_inventory_check_weight();
                                __lootStruct.rotation = 0;
                                __SetRotatedSize(__lootStruct.rotation);
                                exit;
                            }
                            
                            _destination = uiFindRelaxed(uiCurrentRoot(), "weapon slot 2");
                            
                            if (_destination != undefined && _destination.AutoPlace(self))
                            {
                                ui_inventory_check_weight();
                                __lootStruct.rotation = 0;
                                __SetRotatedSize(__lootStruct.rotation);
                                exit;
                            }
                            
                            break;
                        
                        case "armor":
                            _destination = uiFindRelaxed(uiCurrentRoot(), "armor slot");
                            
                            if (_destination != undefined && _destination.AutoPlace(self))
                            {
                                ui_inventory_check_weight();
                                __lootStruct.rotation = 0;
                                __SetRotatedSize(__lootStruct.rotation);
                                exit;
                            }
                            
                            break;
                        
                        case "backpack":
                            _destination = uiFindRelaxed(uiCurrentRoot(), "backpack slot");
                            
                            if (_destination != undefined && _destination.AutoPlace(self))
                            {
                                ui_inventory_check_weight();
                                __lootStruct.rotation = 0;
                                __SetRotatedSize(__lootStruct.rotation);
                                exit;
                            }
                            
                            break;
                        
                        case "headset":
                            _destination = uiFindRelaxed(uiCurrentRoot(), "headset slot");
                            
                            if (_destination != undefined && _destination.AutoPlace(self))
                            {
                                ui_inventory_check_weight();
                                __lootStruct.rotation = 0;
                                __SetRotatedSize(__lootStruct.rotation);
                                exit;
                            }
                            
                            break;
                    }
                    
                    if (ui_is_trading())
                    {
                        if (!item_can_be_traded(__lootStruct.item))
                            exit;
                        
                        _destination = uiFindRelaxed(uiCurrentRoot(), "sell inventory");
                    }
                    else
                    {
                        if (!ui_stash_is_open())
                        {
                            if (!item_can_be_traded(__lootStruct.item))
                                exit;
                        }
                        
                        _destination = uiFindRelaxed(uiCurrentRoot(), "other inventory");
                    }
                    
                    break;
                
                case "other inventory":
                    if (ui_is_trading())
                    {
                        if (!item_can_be_traded(__lootStruct.item))
                            exit;
                        
                        _destination = uiFindRelaxed(uiCurrentRoot(), "buy inventory");
                    }
                    else
                    {
                        _destination = uiFindRelaxed(uiCurrentRoot(), "player inventory");
                    }
                    
                    break;
                
                case "sell inventory":
                    if (!item_can_be_traded(__lootStruct.item))
                        exit;
                    
                    _destination = uiFindRelaxed(uiCurrentRoot(), "player inventory");
                    break;
                
                case "buy inventory":
                    if (!item_can_be_traded(__lootStruct.item))
                        exit;
                    
                    _destination = uiFindRelaxed(uiCurrentRoot(), "other inventory");
                    break;
                
                case "weapon slot 1":
                case "weapon slot 2":
                case "backpack slot":
                case "armor slot":
                case "headset slot":
                case "quick slot 1":
                case "quick slot 2":
                case "quick slot 3":
                case "quick slot 4":
                case "quick slot 5":
                case "quick slot 6":
                    _destination = uiFindRelaxed(uiCurrentRoot(), "player inventory");
                    __lootStruct.rotation = 0;
                    __SetRotatedSize(__lootStruct.rotation);
                    break;
            }
            
            if (_destination != undefined)
            {
                Set("rotation", __lootStruct.rotation);
                
                if (AutoPlace(_destination, __lootStruct.quantity, true))
                {
                    if (is_undefined(struct_get_from_hash(__lootStruct, variable_get_hash("placement"))))
                        __lootStruct.placement = "player inventory";
                    
                    __lootStruct.rotation = Get("rotation");
                    __SetRotatedSize(__lootStruct.rotation);
                    var _loot_placement = __lootStruct.placement;
                    hover_to_local_item(_loot_placement);
                    __lootStruct.placement = _destination.identifier;
                    ui_inventory_check_weight();
                }
            }
            else
            {
                trace("Could not find inventory to place in (parent=", Get("parent"), ")");
            }
        }
    }
    
    hover_to_local_item = function(arg0 = "player inventory")
    {
        var _root = uiLayerGetRoot("inventory layer");
        var _loot_array = uiFindAllType(_root, "class_ui_item");
        
        if (array_length(_loot_array) > 0)
        {
            var _dist_new = 0;
            var _dist_best = point_distance(__lootStruct.x, __lootStruct.y, _loot_array[0].__lootStruct.x, _loot_array[0].__lootStruct.y);
            
            for (var _i = 0; _i < array_length(_loot_array); _i++)
            {
                var _loot = _loot_array[_i].__lootStruct;
                
                if (_loot == __lootStruct)
                {
                    array_delete(_loot_array, _i--, 1);
                }
                else if (!variable_struct_exists(_loot, "placement"))
                {
                    array_delete(_loot_array, _i--, 1);
                }
                else if (arg0 == _loot.placement)
                {
                    _dist_new = point_distance(__lootStruct.x, __lootStruct.y, _loot_array[_i].__lootStruct.x, _loot_array[_i].__lootStruct.y);
                    
                    if (_dist_best > _dist_new)
                    {
                        _dist_best = _dist_new;
                        array_delete(_loot_array, 0, _i);
                        _i = 0;
                    }
                }
                else
                {
                    array_delete(_loot_array, _i--, 1);
                    continue;
                }
            }
            
            if (array_length(_loot_array) > 0)
                __uiHoverSet(uiCurrentRoot(), _loot_array[0], 0);
        }
    };
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_6 = 6,
    Value_7,
    Value_11 = 11,
    Value_12,
    Value_29 = 29,
    Value_30
}
