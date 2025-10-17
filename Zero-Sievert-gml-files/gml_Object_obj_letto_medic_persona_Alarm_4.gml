if (quest_is_complete("laboratory_document") && !quest_is_complete("the_crystal"))
{
    instance_destroy();
    instance_create_depth(x, y, 0, obj_letto_medic_persona_elicottero);
}
