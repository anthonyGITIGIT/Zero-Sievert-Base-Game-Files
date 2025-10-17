var already_done = quest_is_complete("unlock_makeshift_camp");

if (already_done || global.general_debug)
    instance_destroy();

alarm[10] = 120;
