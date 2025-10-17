if (state != prev_state)
    can_talk = true;

prev_state = state;
var im = s_vuoto;
var ims = 0;

if (xprevious != x || yprevious != y)
{
    im = sprite_move;
    ims = npc_get_ims_move(npc_id);
    walk_time++;
    var dis_da_step_prima = point_distance(x, y, xprevious, yprevious);
    
    if (dis_da_step_prima >= 1.1)
        walk_time += dis_da_step_prima;
    
    if (walk_time >= 30)
    {
        walk_time = 0;
        scr_choose_footstep_sound(npc_get_footstep_sound(npc_id));
    }
}

if (xprevious == x && yprevious == y)
{
    im = sprite_idle;
    ims = npc_get_ims_idle(npc_id);
}

if (state == "human_chase_target" || state == "human_take_cover" || state == "human_go_to_bancone_hub" || state == "human_go_to_original_position" || human_state_now == UnknownEnum.Value_16 || human_state_now == UnknownEnum.Value_18 || human_state_now == UnknownEnum.Value_12 || human_state_now == UnknownEnum.Value_15)
{
    if (x != xprevious)
    {
        var dir = point_direction(xprevious, yprevious, x, y);
        weapon_pointing_direction = dir;
        target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
    }
}

if (human_state_now == UnknownEnum.Value_33)
{
    target_for_image_scale = x + 10;
    weapon_pointing_direction = 0;
}

if (state == "rabbit_idle2")
{
    im = s_rabbit_idle2;
    ims = 0.5;
}

if (state == "wolf_attack")
{
    im = s_enemy_wolf_brown_attack;
    ims = 1;
}

if (state == "wolf_attack2")
{
    im = s_enemy_wolf_brown_attack2;
    ims = 1;
}

if (state == "ghoul_attack1")
{
    im = s_ghoul_attack1;
    ims = 1;
}

if (state == "big_aggro")
{
    im = s_big_aggro;
    ims = 0.5;
}

if (state == "big_ruggito")
{
    im = s_big_ruggito;
    ims = 1;
}

if (state == "big_attack1")
{
    im = s_big_attack1;
    ims = 0.5;
}

if (state == "blink_attack1")
{
    im = s_blink_attack1;
    ims = 1.2;
}

if (state == "wolf_idle2")
{
    im = s_lupo_idle2;
    ims = 0.4;
}

if (state == "wolf_eat")
{
    im = s_lupo_eat;
    ims = 0.5;
}

if (state == "wolf_sleep")
{
    im = s_lupo_sleep;
    ims = 0.25;
}

if (state == "wolf_ringhio")
{
    im = s_lupo_ringhio;
    ims = 1.1;
}

if (state == "wolf_attack_1")
{
    im = s_lupo_a1;
    ims = 1;
}

if (state == "wolf_attack_2")
{
    im = s_lupo_a2;
    ims = 1;
}

if (state == "wolf_ululato")
{
    im = s_lupo_ululato;
    ims = 1;
}

if (state == "boar_raspare")
{
    im = s_enemy_cinghiale_raspare;
    ims = 1;
}

if (sprite_before != im)
    image_index = 0;

sprite_index = im;
image_speed = ims;
sprite_before = im;
mods_object_perform_event("step_end_event");

enum UnknownEnum
{
    Value_12 = 12,
    Value_15 = 15,
    Value_16,
    Value_18 = 18,
    Value_33 = 33
}
