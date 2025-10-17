for (var i = 0; i < 30; i++)
{
    var _quest_id = global.quest_state[i].id;
    
    if (_quest_id != "")
    {
        if (_quest_id == "the_crystal")
        {
            if (global.quest_state[i].amount_now[0] == variable_struct_get(global.quest_database, _quest_id).objective[0].amount_max)
            {
                instance_create_depth(x, y, 0, obj_solid_can_see);
                instance_destroy();
            }
        }
    }
}
