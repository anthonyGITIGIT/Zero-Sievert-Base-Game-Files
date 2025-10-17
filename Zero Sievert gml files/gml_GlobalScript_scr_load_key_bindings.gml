function scr_load_key_bindings()
{
    for (var i = 0; i <= UnknownEnum.Value_41; i++)
    {
        global.kb_hold[i] = false;
        global.kb_pressed[i] = false;
        global.kb_accept_mouse[i] = true;
        global.kb_allowed_duplicate[i] = false;
    }
    
    var a = UnknownEnum.Value_0;
    global.kb_id[a] = a;
    global.kb_default[a] = 87;
    global.kb_now[a] = 87;
    global.kb_name[a] = "Move up";
    global.kb_accept_mouse[a] = false;
    global.kb_press_type[a] = UnknownEnum.Value_0;
    a = UnknownEnum.Value_1;
    global.kb_id[a] = a;
    global.kb_default[a] = 83;
    global.kb_now[a] = 83;
    global.kb_name[a] = "Move down";
    global.kb_accept_mouse[a] = false;
    global.kb_press_type[a] = UnknownEnum.Value_0;
    a = UnknownEnum.Value_2;
    global.kb_id[a] = a;
    global.kb_default[a] = 68;
    global.kb_now[a] = 68;
    global.kb_name[a] = "Move right";
    global.kb_accept_mouse[a] = false;
    global.kb_press_type[a] = UnknownEnum.Value_0;
    a = UnknownEnum.Value_3;
    global.kb_id[a] = a;
    global.kb_default[a] = 65;
    global.kb_now[a] = 65;
    global.kb_name[a] = "Move left";
    global.kb_accept_mouse[a] = false;
    global.kb_press_type[a] = UnknownEnum.Value_0;
    a = UnknownEnum.Value_4;
    global.kb_id[a] = a;
    global.kb_default[a] = 16;
    global.kb_now[a] = 16;
    global.kb_name[a] = "Run";
    global.kb_press_type[a] = UnknownEnum.Value_3;
    a = UnknownEnum.Value_5;
    global.kb_id[a] = a;
    global.kb_default[a] = 9;
    global.kb_now[a] = 9;
    global.kb_name[a] = "Open/close inventory";
    global.kb_accept_mouse[a] = false;
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_6;
    global.kb_id[a] = a;
    global.kb_default[a] = 70;
    global.kb_now[a] = 70;
    global.kb_name[a] = "Interact";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_7;
    global.kb_id[a] = a;
    global.kb_default[a] = 82;
    global.kb_now[a] = 82;
    global.kb_name[a] = "Reload";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_8;
    global.kb_id[a] = a;
    global.kb_default[a] = 84;
    global.kb_now[a] = 84;
    global.kb_name[a] = "Torch On/Off";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_9;
    global.kb_id[a] = a;
    global.kb_default[a] = 76;
    global.kb_now[a] = 76;
    global.kb_name[a] = "Laser On/Off";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_14;
    global.kb_id[a] = a;
    global.kb_default[a] = 78;
    global.kb_now[a] = 78;
    global.kb_name[a] = "Headset On/Off";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_10;
    global.kb_id[a] = a;
    global.kb_default[a] = 74;
    global.kb_now[a] = 74;
    global.kb_name[a] = "Open device";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_11;
    global.kb_id[a] = a;
    global.kb_default[a] = 77;
    global.kb_now[a] = 77;
    global.kb_name[a] = "Open map";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_12;
    global.kb_id[a] = a;
    global.kb_default[a] = 71;
    global.kb_now[a] = 71;
    global.kb_name[a] = "Throw bolt";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_13;
    global.kb_id[a] = a;
    global.kb_default[a] = 66;
    global.kb_now[a] = 66;
    global.kb_name[a] = "Switch auto/semi";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_23;
    global.kb_id[a] = a;
    global.kb_default[a] = 89;
    global.kb_now[a] = 89;
    global.kb_name[a] = "Change ammo";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_24;
    global.kb_id[a] = a;
    global.kb_default[a] = 75;
    global.kb_now[a] = 75;
    global.kb_name[a] = "Close-up of the weapon";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_25;
    global.kb_id[a] = a;
    global.kb_default[a] = 72;
    global.kb_now[a] = 72;
    global.kb_name[a] = "Teleport to NPC";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_26;
    global.kb_id[a] = a;
    global.kb_default[a] = 86;
    global.kb_now[a] = 86;
    global.kb_name[a] = "Fix weapon jam";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    var _quickslot_text = language_get_string("Quick slot");
    a = UnknownEnum.Value_15;
    global.kb_id[a] = a;
    global.kb_default[a] = 49;
    global.kb_now[a] = 49;
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "1");
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_16;
    global.kb_id[a] = a;
    global.kb_default[a] = 50;
    global.kb_now[a] = 50;
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "2");
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_17;
    global.kb_id[a] = a;
    global.kb_default[a] = 51;
    global.kb_now[a] = 51;
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "3");
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_18;
    global.kb_id[a] = a;
    global.kb_default[a] = 52;
    global.kb_now[a] = 52;
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "4");
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_19;
    global.kb_id[a] = a;
    global.kb_default[a] = 53;
    global.kb_now[a] = 53;
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "5");
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_20;
    global.kb_id[a] = a;
    global.kb_default[a] = 54;
    global.kb_now[a] = 54;
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "6");
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_21;
    global.kb_id[a] = a;
    global.kb_default[a] = 55;
    global.kb_now[a] = 55;
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "7");
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_22;
    global.kb_id[a] = a;
    global.kb_default[a] = 56;
    global.kb_now[a] = 56;
    global.kb_name[a] = string_replace(_quickslot_text, "[SLOT_NUMBER]", "8");
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_40;
    global.kb_id[a] = a;
    global.kb_default[a] = 8;
    global.kb_now[a] = 8;
    global.kb_name[a] = "Cancel";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    a = UnknownEnum.Value_29;
    global.kb_id[a] = a;
    global.kb_default[a] = 82;
    global.kb_now[a] = 82;
    global.kb_name[a] = "Rotate";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    global.kb_allowed_duplicate[a] = true;
    a = UnknownEnum.Value_30;
    global.kb_id[a] = a;
    global.kb_default[a] = 162;
    global.kb_now[a] = 162;
    global.kb_name[a] = "Quick move";
    global.kb_press_type[a] = UnknownEnum.Value_1;
    global.kb_allowed_duplicate[a] = true;
    a = UnknownEnum.Value_31;
    global.kb_id[a] = a;
    global.kb_default[a] = 162;
    global.kb_now[a] = 162;
    global.kb_name[a] = "Split stack";
    global.kb_press_type[a] = UnknownEnum.Value_3;
    global.kb_allowed_duplicate[a] = true;
    db_open("local settings");
    
    for (var i = 0; i < array_length_1d(global.kb_id); i++)
        global.kb_now[i] = db_read("Keybinding", global.kb_name[i], global.kb_default[i]);
    
    db_close();
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
    Value_29 = 29,
    Value_30,
    Value_31,
    Value_40 = 40,
    Value_41
}
