function class_daily_type_chance(arg0 = 0, arg1 = 0, arg2 = 0, arg3 = 0) constructor
{
    loner = arg0;
    scientist = arg1;
    green_army = arg2;
    crimson = arg3;
}

function class_daily_kill(arg0, arg1, arg2, arg3, arg4, arg5 = 0, arg6 = 0, arg7 = 0, arg8 = 0) constructor
{
    object = arg0;
    name = arg1;
    amount = arg2;
    lvl_min = arg3;
    map = arg4;
    choosen = false;
    chance_loner = arg5;
    chance_scientst = arg6;
    chance_ga = arg7;
    chance_cc = arg8;
}

function class_daily_collect(arg0, arg1, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0) constructor
{
    item = arg0;
    amount = arg1;
    lvl_min = 1;
    choosen = false;
    chance = 1;
    chance_loner = arg2;
    chance_scientst = arg3;
    chance_ga = arg4;
    chance_cc = arg5;
}

function class_daily_contract(arg0, arg1, arg2, arg3, arg4 = 0, arg5 = 0, arg6 = 0, arg7 = 0) constructor
{
    object = arg0;
    name = arg1;
    map = arg2;
    lvl_min = arg3;
    choosen = false;
    chance_loner = arg4;
    chance_scientst = arg5;
    chance_ga = arg6;
    chance_cc = arg7;
}

function class_daily_survive(arg0, arg1, arg2, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0) constructor
{
    map = arg0;
    amount = arg1;
    lvl_min = arg2;
    choosen = false;
    chance_loner = arg3;
    chance_scientst = arg4;
    chance_ga = arg5;
    chance_cc = arg6;
}

function class_daily_survive_exp(arg0, arg1, arg2, arg3, arg4 = 0, arg5 = 0, arg6 = 0, arg7 = 0) constructor
{
    map = arg0;
    amount = arg1;
    lvl_min = arg2;
    amount_var = arg3;
    choosen = false;
    chance_loner = arg4;
    chance_scientst = arg5;
    chance_ga = arg6;
    chance_cc = arg7;
}

function class_daily_survive_money(arg0, arg1, arg2, arg3, arg4 = 0, arg5 = 0, arg6 = 0, arg7 = 0) constructor
{
    map = arg0;
    amount = arg1;
    lvl_min = arg2;
    amount_var = arg3;
    choosen = false;
    chance_loner = arg4;
    chance_scientst = arg5;
    chance_ga = arg6;
    chance_cc = arg7;
}

function class_daily_retrieve_analyzer(arg0, arg1, arg2, arg3, arg4 = -1, arg5 = 0, arg6 = 0, arg7 = 0, arg8 = 0) constructor
{
    ano_id = arg0;
    lvl_min = arg3;
    item = arg1;
    chest_obj = arg2;
    map = arg4;
    choosen = false;
    chance_loner = arg5;
    chance_scientst = arg6;
    chance_ga = arg7;
    chance_cc = arg8;
}

function class_daily_place_analyzer(arg0, arg1, arg2 = -1, arg3, arg4 = 0, arg5 = 0, arg6 = 0, arg7 = 0) constructor
{
    ano_id = arg0;
    object_id = arg3;
    lvl_min = arg1;
    map = arg2;
    choosen = false;
    chance_loner = arg4;
    chance_scientst = arg5;
    chance_ga = arg6;
    chance_cc = arg7;
}

function class_daily_retrieve_equipment(arg0, arg1, arg2, arg3, arg4 = -1, arg5 = 0, arg6 = 0, arg7 = 0, arg8 = 0) constructor
{
    item_id = arg1;
    chest_obj = arg2;
    faction = arg0;
    lvl_min = arg3;
    map = arg4;
    choosen = false;
    chance_loner = arg5;
    chance_scientst = arg6;
    chance_ga = arg7;
    chance_cc = arg8;
}
