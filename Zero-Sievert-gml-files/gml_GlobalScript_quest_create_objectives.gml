function quest_create_kill(arg0, arg1 = "", arg2 = -1, arg3 = [], arg4 = 0, arg5 = "") constructor
{
    type = "kill";
    amount_max = arg0;
    faction = arg1;
    map = arg2;
    array_kill = arg3;
    marker_radius = arg4;
    text = arg5;
}

function quest_create_collect(arg0, arg1, arg2 = 0, arg3 = "") constructor
{
    type = "collect";
    amount_max = arg1;
    item = arg0;
    marker_radius = arg2;
    text = arg3;
}

function quest_create_survive_map(arg0, arg1, arg2 = 0, arg3 = "") constructor
{
    type = "survive";
    amount_max = arg1;
    map = arg0;
    marker_radius = arg2;
    text = arg3;
}

function quest_create_survive_min_money(arg0, arg1, arg2, arg3 = 0, arg4 = "") constructor
{
    type = "survive_money";
    amount_max = arg1;
    map = arg0;
    money_amount = arg2;
    marker_radius = arg3;
    text = arg4;
}

function quest_create_survive_min_exp(arg0, arg1, arg2, arg3 = 0, arg4 = "") constructor
{
    type = "survive_exp";
    amount_max = arg1;
    map = arg0;
    exp_amount = arg2;
    marker_radius = arg3;
    text = arg4;
}

function quest_create_approach(arg0, arg1, arg2 = -1, arg3 = 0, arg4 = "") constructor
{
    type = "approach";
    amount_max = 1;
    map = arg2;
    object = arg0;
    distance = arg1;
    marker_radius = arg3;
    text = arg4;
}

function quest_create_contract(arg0, arg1 = -1, arg2 = "", arg3 = 0, arg4 = "", arg5 = false) constructor
{
    type = "contract";
    amount_max = 1;
    map = arg1;
    object = arg0;
    object_name = arg2;
    marker_radius = arg3;
    text = arg4;
    already_created = arg5;
}

function quest_create_interact_obj(arg0, arg1 = -1, arg2, arg3 = "", arg4 = -1, arg5 = -1, arg6 = -1, arg7 = -4, arg8 = 0, arg9 = "") constructor
{
    type = "interact_obj";
    amount_max = 1;
    object = arg0;
    item_id = arg1;
    distance = arg2;
    text_prompt = arg3;
    map = arg4;
    text_if_item = arg5;
    text_if_no_item = arg6;
    marker_object = arg7;
    marker_radius = arg8;
    text = arg9;
}

function quest_create_place_marker(arg0, arg1 = -1, arg2 = 0, arg3 = "") constructor
{
    type = "place_marker";
    amount_max = 1;
    map = arg1;
    object = arg0;
    marker_radius = arg2;
    text = arg3;
}

function quest_create_retrieve_analyzer(arg0, arg1 = -1, arg2, arg3, arg4 = 0, arg5 = "") constructor
{
    type = "retrieve_analyzer";
    amount_max = 1;
    map = arg1;
    item = arg0;
    chest_obj = arg2;
    anomaly_generator_id = arg3;
    marker_radius = arg4;
    text = arg5;
}

function quest_create_retrieve(arg0, arg1 = -1, arg2, arg3 = 0, arg4 = "") constructor
{
    type = "retrieve";
    amount_max = 1;
    map = arg1;
    item = arg0;
    chest_id = arg2;
    marker_radius = arg3;
    text = arg4;
}

function quest_create_scripted(arg0 = 0, arg1 = "") constructor
{
    type = "scripted";
    amount_max = 1;
    marker_radius = arg0;
    text = arg1;
}

function quest_create_place_analyzer(arg0, arg1, arg2 = -1, arg3, arg4 = "", arg5 = -1, arg6 = -1, arg7 = -1, arg8 = -4, arg9 = 0, arg10 = "") constructor
{
    type = "place_analyzer";
    amount_max = 1;
    anomaly_generator_id = arg0;
    object = arg1;
    item_id = arg2;
    distance = arg3;
    text_prompt = arg4;
    map = arg5;
    text_if_item = arg6;
    text_if_no_item = arg7;
    marker_object = arg8;
    marker_radius = arg9;
    text = arg10;
}

function quest_create_retrieve_equipment(arg0, arg1, arg2 = -1, arg3 = -4, arg4 = 0, arg5 = "") constructor
{
    type = "retrieve_equipment";
    amount_max = 1;
    item = arg1;
    faction = arg0;
    map = arg2;
    marker_object = arg3;
    marker_radius = arg4;
    text = arg5;
}
