switch (ds_map_find_value(async_load, "event_type"))
{
    case "gamepad discovered":
        scr_draw_text_with_box("Gamepad connected");
        scr_gamepad_update_glyph_type();
        array_push(connected_devices, ds_map_find_value(async_load, "pad_index"));
        rumble(UnknownEnum.Value_2);
        break;
    
    case "gamepad lost":
        scr_draw_text_with_box("Gamepad disconnected");
        scr_gamepad_update_glyph_type();
        array_delete(connected_devices, array_find_index(connected_devices, ds_map_find_value(async_load, "pad_index")), 1);
        break;
}

enum UnknownEnum
{
    Value_2 = 2
}
