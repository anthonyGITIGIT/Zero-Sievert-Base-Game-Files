function scr_gamepad_action_string_to_kb_enum(arg0)
{
    switch (arg0)
    {
        case "up":
            return UnknownEnum.Value_0;
        
        case "down":
            return UnknownEnum.Value_1;
        
        case "right":
            return UnknownEnum.Value_2;
        
        case "left":
            return UnknownEnum.Value_3;
        
        case "run":
            return UnknownEnum.Value_4;
        
        case "inventory":
            return UnknownEnum.Value_5;
        
        case "interact":
            return UnknownEnum.Value_6;
        
        case "reload":
            return UnknownEnum.Value_7;
        
        case "torch":
            return UnknownEnum.Value_8;
        
        case "laser":
            return UnknownEnum.Value_9;
        
        case "device":
            return UnknownEnum.Value_10;
        
        case "map":
            return UnknownEnum.Value_11;
        
        case "bolt":
            return UnknownEnum.Value_12;
        
        case "switch_shoot_mode":
            return UnknownEnum.Value_13;
        
        case "headset":
            return UnknownEnum.Value_14;
        
        case "weapon1":
            return UnknownEnum.Value_15;
        
        case "weapon2":
            return UnknownEnum.Value_16;
        
        case "qs1":
            return UnknownEnum.Value_17;
        
        case "qs2":
            return UnknownEnum.Value_18;
        
        case "qs3":
            return UnknownEnum.Value_19;
        
        case "qs4":
            return UnknownEnum.Value_20;
        
        case "qs5":
            return UnknownEnum.Value_21;
        
        case "qs6":
            return UnknownEnum.Value_22;
        
        case "change_ammo":
            return UnknownEnum.Value_23;
        
        case "weapon_look":
            return UnknownEnum.Value_24;
        
        case "quick_move":
            return UnknownEnum.Value_25;
        
        case "fix_jam":
            return UnknownEnum.Value_26;
        
        case "shoot":
            return UnknownEnum.Value_27;
        
        case "scope_aiming":
            return UnknownEnum.Value_28;
        
        case "inventory_rotate_item":
            return UnknownEnum.Value_29;
        
        case "inventory_quick_move":
            return UnknownEnum.Value_30;
        
        case "inventory_split":
            return UnknownEnum.Value_31;
        
        case "inventory_tooltip":
            return UnknownEnum.Value_32;
        
        case "radial_menu_left":
            return UnknownEnum.Value_34;
        
        case "radial_menu_right":
            return UnknownEnum.Value_33;
        
        case "navigation_up":
            return UnknownEnum.Value_35;
        
        case "navigation_down":
            return UnknownEnum.Value_36;
        
        case "navigation_left":
            return UnknownEnum.Value_37;
        
        case "navigation_right":
            return UnknownEnum.Value_38;
        
        default:
            break;
    }
    
    show_error("ERROR: scr_gamepad_action_string_to_kb_enum() was given a string it didnt know how to convert", true);
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38
}
