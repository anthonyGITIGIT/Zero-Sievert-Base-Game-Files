fuse_time_now = 0;
detonation_duration_now = 0;
faction = "";
hspd = 0;
vspd = 0;
vector_calculated = false;
distance_travelled = 0;
explode = false;
can_explode = false;
detonation_done = false;
image_speed = 0;
min_wall_bounce = 8;
distance_floor_bounce = 0;
distance_floor_bounce_max = 12;
direction_image_angle = 1;

if (instance_exists(player_get_local()))
{
    if (player_get_local().x > obj_cursor.aa_x)
        direction_image_angle = 1;
    else
        direction_image_angle = -1;
}

image_angle_amount = 12;
scale_mult = 0.01;
scale_now = 1;
scale_max = 2;
thrown_by_player = false;
alarm[0] = 1;
bouncing = [];

if (throw_type != "GRENADE_throw_no_bounce")
{
    array_push(bouncing, 
    {
        point: 0.7,
        height: 15
    });
    array_push(bouncing, 
    {
        point: 0.9,
        height: 4
    });
    array_push(bouncing, 
    {
        point: 1,
        height: 2
    });
}
else
{
    array_push(bouncing, 
    {
        point: 1,
        height: 16
    });
}

emitter_land = audio_emitter_create();
audio_emitter_falloff(emitter_land, 128, 250, 1);
audio_played = false;
