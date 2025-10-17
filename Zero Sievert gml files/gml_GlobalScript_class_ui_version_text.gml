uiAddBoxType("UiVersionText", class_ui_version_text);

function class_ui_version_text() : uiClassText() constructor
{
    Set("font", font_get_name(font_munro_32px));
    CallbackSet(UnknownEnum.Value_12, function()
    {
        color = 4259071;
        
        if (!steam_initialised() && (current_time % 1000) < 500)
            color = 255;
        
        if (!db_cloud_enabled() && (current_time % 500) < 250)
            color = 32767;
        
        uiCallInherited();
    });
}

enum UnknownEnum
{
    Value_12 = 12
}
