event_inherited();
npc_setup("infestation_1");
timer = 0;
timer_max = 30;
spawn_amount = 1;
spawn_max = 15;
max_same_time = 10;
spawned = 0;

repeat (2 + irandom(2))
    instance_create_depth(x + irandom_range(-16, 16), y + irandom_range(-16, 16), 0, obj_enemy_ghoul);
