uiAddBoxType("UiSpriteButton", class_ui_sprite_button);

function class_ui_sprite_button() : uiClassSpriteButton() constructor
{
    CallbackSet(UnknownEnum.Value_0, function()
    {
        uiCallInherited();
        audio_play_sound(snd_button_hover_rad, 15, false);
    });
    CallbackSet(UnknownEnum.Value_7, function()
    {
        uiCallInherited();
        audio_play_sound(snd_button_click_rad, 15, false);
    });
}

enum UnknownEnum
{
    Value_0,
    Value_7 = 7
}
