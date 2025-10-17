if (place_meeting(x, y, obj_npc_parent) || player_any_meeting(x, y) || place_meeting(x, y, obj_chest_general))
    image_alpha = 0.5;
else
    image_alpha = 1;
