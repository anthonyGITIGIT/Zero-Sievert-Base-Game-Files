function stat_get_value(arg0)
{
    if (!variable_struct_exists(global.stat_data, arg0))
        trace_error("Stat \"", arg0, "\" not recognised");
    
    switch (arg0)
    {
        case "survival_rate":
            return round((100 * stat_get_value("tot_hunt_survived")) / max(1, stat_get_value("tot_hunt")));
            break;
        
        case "tot_human":
            return stat_get_value("bandit") + stat_get_value("green_army") + stat_get_value("crimson") + stat_get_value("scientist") + stat_get_value("loner");
            break;
        
        case "tot_mutant":
            return stat_get_value("wolf") + stat_get_value("boar") + stat_get_value("ghoul") + stat_get_value("blink") + stat_get_value("spider") + stat_get_value("rat") + stat_get_value("big") + stat_get_value("rabbit");
            break;
        
        case "tot_chest":
            return stat_get_value("tool_box") + stat_get_value("medication") + stat_get_value("electronic") + stat_get_value("bag") + stat_get_value("cabinet") + stat_get_value("safe") + stat_get_value("wood_box") + stat_get_value("hidden_stash") + stat_get_value("weapon_box") + stat_get_value("attachment_box") + stat_get_value("vending_machine") + stat_get_value("crystal");
            break;
    }
    
    return variable_struct_get(global.stat_value, arg0) ?? 0;
}
