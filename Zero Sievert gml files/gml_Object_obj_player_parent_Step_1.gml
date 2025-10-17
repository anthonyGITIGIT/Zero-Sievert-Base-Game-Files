if (item_get_category(arma_now) != "weapon")
    arma_now = "no_item";

hovering_enemy = false;

if (teleport_used_frames > 0)
    teleport_used_frames++;

if (teleport_used_frames >= 5)
    teleport_used_frames = 0;
