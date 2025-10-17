function crafting_craft(arg0)
{
    if (arg0 == undefined)
        exit;
    
    if (!crafting_meet_requirements(arg0, false, true))
        exit;
    
    if (crafting_check_already_installed_module(arg0))
    {
        scr_draw_text_with_box("You already have this module installed");
        exit;
    }
    
    if (crafting_check_level2_module(arg0))
    {
        scr_draw_text_with_box("You have to install previous levels first");
        exit;
    }
    
    if (!inventory_check_for_space(arg0.item, arg0.quantity))
    {
        scr_draw_text_with_box("Not enough inventory space!");
        exit;
    }
    
    if (!global.general_debug)
        crafting_remove_raw_materials(arg0);
    
    inventory_add_item(arg0.item, arg0.quantity);
    var _text = language_get_string("Crafted items");
    _text = string_replace(_text, "[ITEM_NAME]", loot_get_name(arg0));
    _text = string_replace(_text, "[ITEM_AMOUNT]", string(arg0.quantity));
    scr_draw_text_with_box(_text, false);
    blacksmith_achievement();
    ui_crafting_requirements_populate(uiGetData().crafting_loot);
}
