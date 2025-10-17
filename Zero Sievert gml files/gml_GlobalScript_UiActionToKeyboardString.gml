function UiActionToKeyboardString(arg0)
{
    return scr_key_map(global.kb_now[scr_gamepad_action_string_to_kb_enum(arg0)]);
}
