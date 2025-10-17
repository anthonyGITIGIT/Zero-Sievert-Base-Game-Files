alarm[10] = 18 + irandom_range(-5, 5);

if (player_exists_local() && instance_line_of_sight(x, y, player_get_local()) && (place_meeting(x, y, obj_npc_parent) || player_any_meeting(x, y) || place_meeting(x, y, obj_chest_general) || (player_local_state_is(scr_player_state_move) && place_meeting(x, y, obj_mouse))))
    image_alpha = 0.4;
else
    image_alpha = 1;
