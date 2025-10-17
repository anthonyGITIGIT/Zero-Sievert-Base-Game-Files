if (quest_is_active("the_psy_helmet_1") || quest_is_complete("the_psy_helmet_1"))
    instance_create_depth(x, y, 0, obj_unknown_sewer);

instance_destroy();
