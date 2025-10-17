function kill_add_stat(arg0)
{
    switch (arg0)
    {
        case obj_bandit_preset_expert:
            stat_increment("bandit");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_bandit_preset_intermediate:
            stat_increment("bandit");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_bandit_preset_master:
            stat_increment("bandit");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_bandit_preset_rookie:
            stat_increment("bandit");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_bandit_preset_skilled:
            stat_increment("bandit");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_bandit_preset_veteran:
            stat_increment("bandit");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_enemy_human_bandit_regular:
            stat_increment("bandit");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_enemy_human_bandit_novice:
            stat_increment("bandit");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_enemy_human_bandit_boss_guard:
            stat_increment("bandit");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_green_army_soldier1:
            stat_increment("green_army");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_green_army_preset_expert:
            stat_increment("green_army");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_green_army_preset_intermediate:
            stat_increment("green_army");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_green_army_preset_master:
            stat_increment("green_army");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_green_army_preset_rookie:
            stat_increment("green_army");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_green_army_preset_skilled:
            stat_increment("green_army");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_green_army_preset_veteran:
            stat_increment("green_army");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_green_army_cyclops:
            stat_increment("green_army");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_crimson_soldier:
            stat_increment("crimson");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_crimson_preset_expert:
            stat_increment("crimson");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_crimson_preset_intermediate:
            stat_increment("crimson");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_crimson_preset_master:
            stat_increment("crimson");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_crimson_preset_rookie:
            stat_increment("crimson");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_crimson_preset_skilled:
            stat_increment("crimson");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_crimson_preset_veteran:
            stat_increment("crimson");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_crimson_cyclops:
            stat_increment("crimson");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_crimson_guardia_ingresso:
            stat_increment("crimson");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_scientist:
            stat_increment("scientist");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_scientist_2:
            stat_increment("scientist");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_watcher_cyclops:
            stat_increment("watcher");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_watcher_general:
            stat_increment("watcher");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_watcher_preset_expert:
            stat_increment("watcher");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_watcher_preset_intermediate:
            stat_increment("watcher");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_watcher_preset_master:
            stat_increment("watcher");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_watcher_preset_rookie:
            stat_increment("watcher");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_watcher_preset_skilled:
            stat_increment("watcher");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_watcher_preset_veteran:
            stat_increment("watcher");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_loner_novice:
            stat_increment("loner");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_loner_regular:
            stat_increment("loner");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_loner_enemy:
            stat_increment("loner");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_loner_enemy2:
            stat_increment("loner");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_hunter_cyclops:
            stat_increment("loner");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_hunter_preset_expert:
            stat_increment("loner");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_hunter_preset_intermediate:
            stat_increment("loner");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_hunter_preset_master:
            stat_increment("loner");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_hunter_preset_rookie:
            stat_increment("loner");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_hunter_preset_skilled:
            stat_increment("loner");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_hunter_preset_veteran:
            stat_increment("loner");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_enemy_human_bandit_boss:
            stat_increment("boss_lazar");
            steam_stat_increment("enemieskilled");
            lostinthewoods_achievement();
            break;
        
        case obj_boss_arman:
            stat_increment("boss_arman");
            steam_stat_increment("enemieskilled");
            campereliminated_achievement();
            break;
        
        case obj_boss_killa:
            stat_increment("boss_killa");
            steam_stat_increment("enemieskilled");
            canispeaktothemanager_achievement();
            break;
        
        case obj_enemy_human_bandit_boss_outpost:
            stat_increment("boss_orel");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_boss_city:
            stat_increment("boss_valentin");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_watcher_devil:
            stat_increment("boss_devil");
            break;
        
        case obj_enemy_wolf_brown:
            stat_increment("wolf");
            steam_stat_increment("animalskilled");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_enemy_boar:
            stat_increment("boar");
            steam_stat_increment("animalskilled");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_enemy_boar_zombie:
            stat_increment("boar");
            steam_stat_increment("animalskilled");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_enemy_ghoul:
            stat_increment("ghoul");
            steam_stat_increment("enemieskilled");
            steam_stat_increment("ghoulskilled");
            break;
        
        case obj_enemy_blink:
            stat_increment("blink");
            steam_stat_increment("enemieskilled");
            steam_stat_increment("blinkskilled");
            break;
        
        case obj_enemy_spider:
            stat_increment("spider");
            steam_stat_increment("animalskilled");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_enemy_rat:
            stat_increment("rat");
            steam_stat_increment("animalskilled");
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_enemy_big:
            stat_increment("big");
            abigwin_achievement();
            steam_stat_increment("enemieskilled");
            break;
        
        case obj_enemy_rabbit:
            stat_increment("rabbit");
            steam_stat_increment("animalskilled");
            steam_stat_increment("enemieskilled");
            break;
    }
    
    steam_stat_increment("totalkills");
}
