repeat (3 + irandom(2))
    instance_create_depth(x, y, -y, obj_enemy_wolf_brown);

if (scr_chance(25))
    instance_create_depth(x, y, 0, obj_enemy_human_bandit_novice);
