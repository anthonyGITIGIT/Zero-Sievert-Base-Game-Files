function skill_get_level(arg0)
{
    if (is_string(arg0))
    {
        var _new_index = skill_get_index(arg0);
        
        if (_new_index == undefined)
            __uiError("Skill \"", arg0, "\" not recognised");
        
        arg0 = _new_index;
    }
    
    return global.sk_lvl[arg0];
}
