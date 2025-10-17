function skill_specialize(arg0)
{
    if (is_string(arg0))
    {
        var _new_skill = skill_get_index(arg0);
        
        if (_new_skill == undefined)
            __uiError("Skill \"", arg0, "\" not recognised");
        
        arg0 = _new_skill;
    }
    
    global.sk_lvl[arg0] = max(0, global.sk_lvl[arg0]);
    scr_save_skill_and_base();
}
