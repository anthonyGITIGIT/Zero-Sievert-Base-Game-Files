global.achievement_qa_tracking = {};

function steam_stat_increment(arg0)
{
    steam_set_stat_int(arg0, steam_get_stat_int(arg0) + 1);
    trace("Steam stat incremented: " + arg0);
}

function steam_set_achievement_flagged(arg0)
{
    steam_set_achievement(arg0);
}

function welcometozerosievert_achievement()
{
    var _name = "welcometozerosievert";
    
    if (!steam_get_achievement(_name))
        steam_set_achievement_flagged(_name);
}

function blacksmith_achievement()
{
    var _name = "blacksmith";
    
    if (!steam_get_achievement(_name))
        steam_set_achievement_flagged(_name);
}

function aliensexist_achievement()
{
    var _name = "aliensexist";
    
    if (!steam_get_achievement(_name))
        steam_set_achievement_flagged(_name);
}

function heavypockets_achievement()
{
    if (global.player_money >= 1000000)
    {
        var _name = "heavypockets";
        
        if (!steam_get_achievement(_name))
            steam_set_achievement_flagged(_name);
    }
}

function rockbottom_achievement()
{
    if (global.player_money <= 10)
    {
        var _name = "rockbottom";
        
        if (!steam_get_achievement(_name))
            steam_set_achievement_flagged(_name);
    }
}

function lostinthewoods_achievement()
{
    var _name = "lostinthewoods";
    
    if (!steam_get_achievement(_name))
        steam_set_achievement_flagged(_name);
}

function canispeaktothemanager_achievement()
{
    var _name = "canispeaktothemanager";
    
    if (!steam_get_achievement(_name))
        steam_set_achievement_flagged(_name);
}

function campereliminated_achievement()
{
    var _name = "campereliminated";
    
    if (!steam_get_achievement(_name))
        steam_set_achievement_flagged(_name);
}

function abigwin_achievement()
{
    var _name = "abigwin";
    
    if (!steam_get_achievement(_name))
        steam_set_achievement_flagged(_name);
}

function milkrun_achievement()
{
    var _name = "milkrun";
    
    if (!steam_get_achievement(_name))
    {
        if (inventory_get_total_of_item("milk") >= 44)
            steam_set_achievement_flagged(_name);
    }
}

function nothingbutjunk_achievement()
{
    var _name = "nothingbutjunk";
    
    if (!steam_get_achievement(_name))
    {
        with (player_get_local())
        {
            if (shell_shot_count >= 1000)
                steam_set_achievement_flagged(_name);
        }
    }
}

function allthatforadropofblood_achievement()
{
    var _name = "allthatforadropofblood";
    
    if (!steam_get_achievement(_name))
    {
        with (player_get_local())
        {
            if (hp <= 10)
                steam_set_achievement_flagged(_name);
        }
    }
}

function eyeforaneye_achievement()
{
    var _name = "eyeforaneye";
    
    if (!steam_get_achievement(_name))
    {
        if (quest_is_complete("igor_revenge"))
            steam_set_achievement_flagged(_name);
    }
}

function welcometozakovcity_achievement()
{
    var _name = "welcometozakovcity";
    
    if (!steam_get_achievement(_name))
    {
        if (uiGetData().map_selected == UnknownEnum.Value_8)
            steam_set_achievement_flagged(_name);
    }
}

function downwiththesickness_achievement()
{
    var _name = "downwiththesickness";
    
    if (!steam_get_achievement(_name))
    {
        if (quest_is_complete("radiation_effect"))
            steam_set_achievement_flagged(_name);
    }
}

function maxedoutpistol_achievement()
{
    var _name = "maxedoutpistol";
    
    if (!steam_get_achievement(_name))
    {
        if (skills.get_value_dec("mastery_pistol") == 1)
            steam_set_achievement_flagged(_name);
    }
}

function maxedoutsmg_achievement()
{
    var _name = "maxedoutsmg";
    
    if (!steam_get_achievement(_name))
    {
        if (skills.get_value_dec("mastery_smg") == 1)
            steam_set_achievement_flagged(_name);
    }
}

function maxedoutshotgun_achievement()
{
    var _name = "maxedoutshotgun";
    
    if (!steam_get_achievement(_name))
    {
        if (skills.get_value_dec("mastery_shotgun") == 1)
            steam_set_achievement_flagged(_name);
    }
}

function maxedoutrifle_achievement()
{
    var _name = "maxedoutrifle";
    
    if (!steam_get_achievement(_name))
    {
        if (skills.get_value_dec("mastery_rifle") == 1)
            steam_set_achievement_flagged(_name);
    }
}

function maxedoutdmr_achievement()
{
    var _name = "maxedoutdmr";
    
    if (!steam_get_achievement(_name))
    {
        if (skills.get_value_dec("mastery_dmr") == 1)
            steam_set_achievement_flagged(_name);
    }
}

function maxedoutsniper_achievement()
{
    var _name = "maxedoutsniper";
    
    if (!steam_get_achievement(_name))
    {
        if (skills.get_value_dec("mastery_sniper") == 1)
            steam_set_achievement_flagged(_name);
    }
}

function ironman_achievement()
{
    var _name = "ironman";
    
    if (!steam_get_achievement(_name))
    {
        if (difficulty_get("hardcore_perma_death") == true)
            steam_set_achievement_flagged(_name);
    }
}

function bestfriends_achievement()
{
    var _name = "bestfriends";
    
    if (!steam_get_achievement(_name))
    {
        var _faction_maxed = false;
        var _factions = ["Loners", "Green Army", "Crimson Corporation", "Scientists"];
        
        for (var i = 0; i < array_length(_factions); i++)
        {
            if (faction_get_rep("Player", _factions[i]) == 1000)
            {
                _faction_maxed = true;
                break;
            }
        }
        
        if (_faction_maxed)
            steam_set_achievement_flagged(_name);
    }
}

function lastorders_achievement()
{
    var _name = "lastorders";
    
    if (!steam_get_achievement(_name))
    {
        if (quest_is_complete("the_crystal") && quest_is_complete("underground_extraction") && quest_is_complete("stilysh_one_part_2") && quest_is_complete("machinery") && quest_is_complete("bowel_problems") && quest_is_complete("the_guide"))
            steam_set_achievement_flagged(_name);
    }
}

function achievement_step()
{
    if (obj_controller.achievement_update_timer++ >= obj_controller.achievement_update_rate)
    {
        obj_controller.achievement_update_timer = 0;
        heavypockets_achievement();
        rockbottom_achievement();
        milkrun_achievement();
        eyeforaneye_achievement();
        lastorders_achievement();
        downwiththesickness_achievement();
        bestfriends_achievement();
    }
}

enum UnknownEnum
{
    Value_8 = 8
}
