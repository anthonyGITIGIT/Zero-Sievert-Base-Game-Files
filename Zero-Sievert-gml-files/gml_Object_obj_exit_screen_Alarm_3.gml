exp_numero_max = global.xp_survive * factor_survived;

if (global.xp_level_now >= array_length(struct_get_from_hash(global.xp_data, variable_get_hash("levels"))))
    exp_start = 0;

exp_level_start = global.xp_level_now;
level_finish = exp_level_start;
exp_start = clamp(exp_start + exp_numero_max, 0, experience_get_for_level_max());
var _xp_goal = experience_get_for_level(exp_level_start);

while (exp_start >= _xp_goal)
{
    level_finish++;
    exp_start -= _xp_goal;
}

exp_agg_finish = exp_start;
