function skill_get_specialization_skill(arg0, arg1)
{
    if (!is_string(arg0))
    {
        var _new_skill = skill_get_index(arg0);
        
        if (_new_skill == undefined)
            __uiError("Skill \"", arg0, "\" not recognised");
        
        arg0 = _new_skill;
    }
    
    return global.sk_upgrade[arg0][arg1];
}
