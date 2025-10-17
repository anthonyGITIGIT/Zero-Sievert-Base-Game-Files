function player_action_quick_slot()
{
    if (teleport_used_frames > 0)
        exit;
    
    if (global.kb_pressed[UnknownEnum.Value_17])
    {
        inventory_use_quick_slot("quick slot 1");
        global.last_quick_slot_pressed = "quick slot 1";
        return true;
    }
    else if (global.kb_pressed[UnknownEnum.Value_18])
    {
        inventory_use_quick_slot("quick slot 2");
        global.last_quick_slot_pressed = "quick slot 2";
        return true;
    }
    else if (global.kb_pressed[UnknownEnum.Value_19])
    {
        inventory_use_quick_slot("quick slot 3");
        global.last_quick_slot_pressed = "quick slot 3";
        return true;
    }
    else if (global.kb_pressed[UnknownEnum.Value_20])
    {
        inventory_use_quick_slot("quick slot 4");
        global.last_quick_slot_pressed = "quick slot 4";
        return true;
    }
    else if (global.kb_pressed[UnknownEnum.Value_21])
    {
        inventory_use_quick_slot("quick slot 5");
        global.last_quick_slot_pressed = "quick slot 5";
        return true;
    }
    else if (global.kb_pressed[UnknownEnum.Value_22])
    {
        inventory_use_quick_slot("quick slot 6");
        global.last_quick_slot_pressed = "quick slot 6";
        return true;
    }
    
    return false;
}

enum UnknownEnum
{
    Value_17 = 17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22
}
