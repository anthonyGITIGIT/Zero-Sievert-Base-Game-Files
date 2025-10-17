function loot_action_consume_now(arg0)
{
    if (!player_exists_local())
        exit;
    
    var _player = player_get_local();
    var _item = arg0.item;
    var _factor = (struct_get_from_hash(arg0, variable_get_hash("created_from_player")) ?? false) ? global.sk_k[UnknownEnum.Value_36] : 1;
    
    if (is_in_hub() && !settings_get("bunker_animation"))
    {
        _player.energy += _factor * item_consumable_get_energy(_item);
        _player.thirst += _factor * item_consumable_get_thirst(_item);
        _player.fatigue += _factor * item_consumable_get_fatigue(_item);
        _player.radiation_accumulata += _factor * item_consumable_get_radiation(_item);
        var _item_name = item_get_name(_item);
        var _translation = language_get_string("Item consumed");
        scr_draw_text_with_box(string_replace(_translation, "[ITEM_NAME]", _item_name), false);
    }
    else
    {
        var _arms_holder = new class_player_arms(_player, _item, item_consumable_get_animation(_item));
        _arms_holder.r_energy = _factor * item_consumable_get_energy(_item);
        _arms_holder.r_thirst = _factor * item_consumable_get_thirst(_item);
        _arms_holder.r_fatigue = _factor * item_consumable_get_fatigue(_item);
        _arms_holder.r_radiation = _factor * item_consumable_get_radiation(_item);
        _player.arms_holder = _arms_holder;
    }
    
    ui_inventory_close_all();
    uiOnionCurrent().LayerDelete("inventory layer");
    var _item_data = variable_struct_get(global.item_data, _item);
    
    if (variable_struct_exists(_item_data.consumable, "consume_function") && !is_undefined(_item_data.consumable.consume_function))
        _item_data.consumable.consume_function();
    
    loot_decrement(arg0);
}

enum UnknownEnum
{
    Value_36 = 36
}
