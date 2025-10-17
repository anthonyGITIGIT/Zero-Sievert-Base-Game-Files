uiAddBoxType("UiDnDInventory", class_ui_inventory);

function class_ui_inventory() : uiClassDnDInventory() constructor
{
    static _canPlaceHere = function(arg0, arg1, arg2, arg3)
    {
        if (global.Dragging_Loot_Struct != undefined)
        {
            if (array_length(category) > 0)
            {
                var _category = item_get_category(global.Dragging_Loot_Struct.__lootStruct.item);
                
                if (array_find_index(category, _category) == undefined)
                    return false;
            }
        }
        
        if (is_in_hub() && ui_is_trading())
        {
            var _if_trading = uiFindRelaxed(uiLayerGetRoot("inventory layer"), "buy inventory", true);
            
            if (_if_trading != undefined && rectangle_in_rectangle(arg0, arg1, arg2, arg3, _if_trading.__localLeft, _if_trading.__localTop, _if_trading.__localRight, _if_trading.__localBottom))
                return false;
            
            _if_trading = uiFindRelaxed(uiLayerGetRoot("inventory layer"), "other inventory", true);
            
            if (_if_trading != undefined && rectangle_in_rectangle(arg0, arg1, arg2, arg3, _if_trading.__localLeft, _if_trading.__localTop, _if_trading.__localRight, _if_trading.__localBottom))
                return false;
        }
        
        return true;
    };
    
    static PopulatePreview = function(arg0)
    {
        var _i = 0;
        
        repeat (array_length(arg0))
        {
            uiOpen(class_ui_loot_preview);
            uiCurrentOpen().Set("loot", arg0[_i]);
            uiClose();
            _i++;
        }
    };
    
    static PopulateTaskRewards = function(arg0)
    {
        var _i = 0;
        
        repeat (array_length(arg0))
        {
            var _loot = arg0[_i];
            uiOpen(class_ui_loot_reward);
            uiCurrentOpen().Set("loot", _loot);
            var _position = FindEmptyPlace(uiCurrentOpen());
            
            if (_position == undefined)
            {
                uiCurrentOpen().Set("visible", false);
                uiCurrentOpen().Set("active", false);
                _i++;
            }
            else
            {
                uiCurrentOpen().Set("x", _position[0]);
                uiCurrentOpen().Set("y", _position[1]);
                uiCurrentOpen().Set("rotation", _position[2]);
                uiClose();
                _i++;
            }
        }
    };
    
    static GetLootWeight = function()
    {
        var _value = 0;
        var _i = 0;
        
        repeat (array_length(__children))
        {
            _value += loot_get_weight(__children[_i].__lootStruct);
            _i++;
        }
        
        return _value;
    };
    
    static GetLootValue = function()
    {
        var _value = 0;
        var _i = 0;
        
        repeat (array_length(__children))
        {
            _value += loot_get_value(__children[_i].__lootStruct);
            _i++;
        }
        
        return _value;
    };
    
    static GetLootValueDiffMultiplier = function()
    {
        var _value = 0;
        var _i = 0;
        
        repeat (array_length(__children))
        {
            var _multiplier = 1;
            var _mult2 = 1;
            
            switch (loot_get_category(__children[_i].__lootStruct))
            {
                case "weapon":
                    _multiplier = difficulty_get("trade_price_weapon");
                    break;
                
                case "armor":
                    _multiplier = difficulty_get("trade_price_armor");
                    break;
                
                case "backpack":
                    _multiplier = difficulty_get("trade_price_backpack");
                    break;
                
                case "ammo":
                    _multiplier = difficulty_get("trade_price_ammo");
                    break;
                
                case "medication":
                    _multiplier = difficulty_get("trade_price_medication");
                    break;
            }
            
            if (instance_exists(obj_prologue_npc))
                _mult2 = 0.25;
            
            _value += (loot_get_value(__children[_i].__lootStruct) * _multiplier * _mult2);
            _i++;
        }
        
        return _value;
    };
    
    static __HandleDnD = function(arg0, arg1)
    {
        __highlightLeft = 0;
        __highlightTop = 0;
        __highlightRight = 0;
        __highlightBottom = 0;
        __highlightCollision = false;
        var _pointerX = uiPointerGetX() - uiPointerGetCaptureX() - __worldLeft;
        var _pointerY = uiPointerGetY() - uiPointerGetCaptureY() - __worldTop;
        
        if (!arg1)
        {
            if (_pointerX < 0 || _pointerY < 0 || _pointerX > (__localRight - __localLeft) || _pointerY > (__localBottom - __localTop))
                return undefined;
        }
        
        if (ui_is_trading())
        {
            if (!item_can_be_traded(loot_get_item(arg0.__lootStruct)))
                return undefined;
            
            var _if_trading = uiFind(uiLayerGetRoot("inventory layer"), "buy inventory");
            
            if (point_in_rectangle(uiPointerGetX(), uiPointerGetY(), _if_trading.__localLeft, _if_trading.__localTop, _if_trading.__localRight, _if_trading.__localBottom))
                return undefined;
            
            _if_trading = uiFind(uiLayerGetRoot("inventory layer"), "other inventory");
            
            if (point_in_rectangle(uiPointerGetX(), uiPointerGetY(), _if_trading.__localLeft, _if_trading.__localTop, _if_trading.__localRight, _if_trading.__localBottom))
                return undefined;
        }
        else if (uiFind(uiLayerGetRoot("inventory layer"), "other inventory") && !ui_stash_is_open())
        {
            if (!item_can_be_traded(loot_get_item(arg0.__lootStruct)))
            {
                if (identifier == "other inventory")
                    return undefined;
            }
        }
        
        var _draggingWidth = arg0.Get("width");
        var _draggingHeight = arg0.Get("height");
        var _left = _pointerX - (0.5 * _draggingWidth);
        var _top = _pointerY - (0.5 * _draggingHeight);
        var _qLeft = round(_left / __cellWidth);
        var _qTop = round(_top / __cellHeight);
        var _qWidth = 1 + floor(_draggingWidth / __cellWidth);
        var _qHeight = 1 + floor(_draggingHeight / __cellHeight);
        _qLeft = clamp(_qLeft, 0, __cellCountX - _qWidth);
        _qTop = clamp(_qTop, 0, __cellCountY - _qHeight);
        var _qRight = _qLeft + _qWidth;
        var _qBottom = _qTop + _qHeight;
        _qLeft *= __cellWidth;
        _qTop *= __cellHeight;
        _qRight *= __cellWidth;
        _qBottom *= __cellHeight;
        __highlightCollision = false;
        var _mergeTarget = undefined;
        var _attachTarget = undefined;
        var _attachPos = undefined;
        var _posFree = false;
        var _draggedItem = loot_get_item(arg0.__lootStruct);
        var _i = 0;
        
        repeat (array_length(__children))
        {
            var _child = __children[_i];
            
            if (_child != arg0 && _child.RectangleCollides(_qLeft, _qTop, _qRight, _qBottom, overlapTolerance))
            {
                __highlightCollision = true;
                var _childLoot = _child.__lootStruct;
                var _childItem = loot_get_item(_childLoot);
                
                if (_childItem == loot_get_item(arg0.__lootStruct) && loot_get_quantity(_childLoot) < item_get_stack_max(_childItem))
                    _mergeTarget = _child;
                
                if (mod_moddable_in_raid(_draggedItem) && mod_is_compatible(_childItem, _draggedItem))
                {
                    var _pos_array = item_mod_get_position_array(_draggedItem);
                    
                    for (var _j = 0; _j < array_length(_pos_array); _j++)
                    {
                        if (loot_weapon_get_position_moddable(_childLoot, _pos_array[_j]))
                        {
                            _attachTarget = _child;
                            _attachPos = _pos_array[_j];
                            
                            if (!item_exists(loot_mod_cont_get(struct_get_from_hash(_childLoot, variable_get_hash("mods")), _pos_array[_j])))
                            {
                                _posFree = true;
                                break;
                            }
                        }
                    }
                }
                
                break;
            }
            
            _i++;
        }
        
        if (_mergeTarget != undefined)
            __highlightCollision = false;
        
        if (_attachTarget != undefined)
            __highlightCollision = false;
        
        if (_draggingWidth > (__cellWidth * __cellCountX) || _draggingHeight > (__cellHeight * __cellCountY))
        {
            __highlightCollision = false;
            return undefined;
        }
        
        if (!arg1 && __highlightCollision)
        {
            arg0.__dragRotation = arg0.__startingRotation;
            return undefined;
        }
        else
        {
            __highlightLeft = _qLeft;
            __highlightTop = _qTop;
            __highlightRight = _qRight;
            __highlightBottom = _qBottom;
            return 
            {
                __highlightLeft: _qLeft,
                __highlightTop: _qTop,
                __highlightRight: _qRight,
                __highlightBottom: _qBottom,
                x: 0.5 * (_qLeft + _qRight),
                y: 0.5 * (_qTop + _qBottom),
                mergeTarget: _mergeTarget,
                attachTarget: _attachTarget,
                attachPos: _attachPos,
                posFree: _posFree
            };
        }
    };
    
    backgroundColor = 5789784;
    gridLineColor = 4605510;
    gridLineThickness = 4;
    highlightColor = 16777215;
    highlightAlpha = 0.4;
    CallbackSetDnDOnReceive(function(arg0)
    {
        if (arg0 != undefined)
        {
            if (array_length(category) > 0)
            {
                var _category = item_get_category(arg0.__lootStruct.item);
                
                if (array_find_index(category, _category) == undefined)
                    exit;
            }
        }
        
        var _data = __HandleDnD(arg0, false);
        
        if (_data == undefined)
            exit;
        
        var _mergeTarget = _data.mergeTarget;
        var _attachTarget = _data.attachTarget;
        
        if (_mergeTarget == undefined)
        {
            if (_attachTarget != undefined)
            {
                if (_data.posFree)
                {
                    loot_weapon_mod_attach(_attachTarget.__lootStruct, loot_get_item(arg0.__lootStruct), _data.attachPos);
                    loot_decrement(arg0.__lootStruct, 99);
                }
                else
                {
                    scr_draw_text_with_box("Position already occupied!");
                    exit;
                }
            }
            
            if ((keyboard_check(vk_control) || obj_gamepad.action[UnknownEnum.Value_31].value) && !arg0.__quickMove)
            {
                global.UI_Item_Drag_Skip_Placement_Assignment = true;
                var _oldLoot = arg0.__lootStruct;
                
                if (_oldLoot.quantity > 1)
                {
                    if ((arg0.__localLeft div 8) != (_data.__highlightLeft div 8) || (arg0.__localTop div 8) != (_data.__highlightTop div 8))
                    {
                        var _oldQuantity = _oldLoot.quantity;
                        _oldLoot.quantity = floor(_oldQuantity / 2);
                        var _newLoot = loot_duplicate(_oldLoot);
                        
                        with (_newLoot)
                        {
                            quantity = ceil(_oldQuantity / 2);
                            x = _data.x / 4;
                            y = _data.y / 4;
                            placement = other.identifier;
                        }
                        
                        uiOpenExisting(self);
                        uiOpen(class_ui_item);
                        uiCurrentOpen().Set("loot", _newLoot);
                        uiCurrentOpen().Set("x", _data.x);
                        uiCurrentOpen().Set("y", _data.y);
                        uiClose();
                        uiClose();
                        ui_inventory_check_weight();
                    }
                }
            }
            else
            {
                arg0.ParentChange(self);
                arg0.Set("x", _data.x);
                arg0.Set("y", _data.y);
            }
        }
        else
        {
            var _targetLoot = _mergeTarget.__lootStruct;
            var _draggingLoot = arg0.__lootStruct;
            var _stackMax = item_get_stack_max(_targetLoot.item);
            
            if (_targetLoot.quantity >= _stackMax)
                exit;
            
            var _decrement = min(_draggingLoot.quantity, _stackMax - _targetLoot.quantity);
            var _targetValue = min(_stackMax, _targetLoot.quantity + _draggingLoot.quantity);
            loot_decrement(_draggingLoot, _decrement);
            _targetLoot.quantity = _targetValue;
            global.UI_Item_Drag_Skip_Placement_Assignment = true;
        }
        
        var _deal_button = uiFindRelaxed(__FindRoot(), "deal button", true);
        
        if (is_struct(_deal_button))
        {
            _deal_button.__label = language_get_string("Deal") + ": " + string(ui_trader_calculate_deal_value().net_value_for_player);
            _deal_button.__UpdateSize();
        }
    });
    CallbackSetDraw(function()
    {
        var _deal_button = uiFindRelaxed(__FindRoot(), "deal button", true);
        
        if (is_struct(_deal_button))
        {
            _deal_button.__label = language_get_string("Deal") + ": " + string(ui_trader_calculate_deal_value().net_value_for_player);
            _deal_button.__UpdateSize();
            
            if ((global.player_money + ui_trader_calculate_deal_value().net_value_for_player) < 0)
            {
                _deal_button.color = 8880630;
                _deal_button.backgroundColor = 2825865;
                _deal_button.backgroundAlpha = 1;
            }
            else
            {
                _deal_button.color = 16777215;
                _deal_button.backgroundColor = 8421504;
                _deal_button.backgroundAlpha = 1;
            }
        }
        
        var _left = __drawLeft + 3;
        var _top = __drawTop - 1;
        var _right = __drawRight - 2;
        var _bottom = __drawBottom - 2;
        var _backgroundColor = merge_color(color, animBlend, animBlendAmount);
        var _gridLineColor = merge_color(gridLineColor, animBlend, animBlendAmount);
        var _scale = scale * animScale;
        var _alpha = alpha * animAlpha;
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        draw_set_color(backgroundColor);
        draw_set_alpha(_alpha);
        draw_rectangle(_left, _top, _right, _bottom, false);
        var _left_draw = _left + __highlightLeft;
        var _top_draw = _top + __highlightTop;
        var _right_draw = (_left + __highlightRight) - 1;
        var _bottom_draw = (_top + __highlightBottom) - 1;
        
        if (_canPlaceHere(_left_draw, _top_draw, _right_draw, _bottom_draw))
        {
            if (__highlightCollision)
            {
                draw_sprite_repeat(s_hud_item_visto, 0, _left_draw, _top_draw, _right_draw, _bottom_draw, 4, 4, 255, 1);
            }
            else
            {
                draw_set_color(highlightColor);
                draw_set_alpha(_alpha * highlightAlpha);
                draw_rectangle(_left_draw, _top_draw, _right_draw, _bottom_draw, false);
            }
        }
        
        if (showGridLines)
        {
            draw_set_color(_gridLineColor);
            draw_set_alpha(_alpha);
            var _x = _left + __cellWidth;
            
            repeat (__cellCountX - 1)
            {
                draw_rectangle(_x - gridLineThickness, _top, _x - 1, _bottom, false);
                _x += __cellWidth;
            }
            
            var _y = _top + __cellHeight;
            
            repeat (__cellCountY - 1)
            {
                draw_rectangle(_left, _y - gridLineThickness, _right, _y - 1, false);
                _y += __cellHeight;
            }
        }
        
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
    });
}

enum UnknownEnum
{
    Value_31 = 31
}
