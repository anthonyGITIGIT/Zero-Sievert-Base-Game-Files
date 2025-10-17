if (quest_is_complete("laboratory_document") && !quest_is_complete("the_crystal"))
{
    var _y = 1296;
    instance_create_depth(544, _y, 0, obj_letto_branda_quest_elicottero);
    instance_create_depth(560, _y, 0, obj_letto_branda_quest_elicottero);
    instance_create_depth(576, _y, 0, obj_letto_branda_quest_elicottero);
    instance_create_depth(592, _y, 0, obj_letto_branda_quest_elicottero);
    instance_create_depth(608, _y, 0, obj_letto_branda_quest_elicottero);
    instance_create_depth(576, _y + 10, 0, obj_green_army_branda_elicottero);
}

instance_destroy();
