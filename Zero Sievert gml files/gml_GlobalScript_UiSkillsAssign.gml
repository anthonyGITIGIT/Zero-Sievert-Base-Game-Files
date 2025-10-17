function UiSkillsAssign(arg0, arg1, arg2)
{
    with (player_get_local())
    {
        if (UiSkillsCanSelect(arg0, arg1, arg2))
        {
            if (is_in_hub() || global.general_debug)
            {
                UiSkillsReset(arg0, arg1, arg2);
                skills.set(arg0, 1);
                skills.set_mastery(arg0, arg1, arg2);
                return true;
            }
            else
            {
                scr_draw_text_with_box("Gun skills can only be freely changed in the Bunker.");
                return false;
            }
        }
    }
    
    return false;
}
