with (__uiGlobal().__defaultOnion)
{
    if (InputGetMode() == "directional")
        exit;
}

if (instance_exists(obj_exit_screen))
    exit;

var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);

if (player_local_state_is(scr_player_state_inventory, scr_player_state_craft))
    draw_sprite(sprite_index, image_index, x - camx, y - camy);

if (player_local_state_is(scr_player_state_pda, scr_player_state_item_spawn, scr_player_state_teleport) || (instance_exists(obj_controller) && __uiGlobal().__defaultOnion.HasInputReceiver()))
{
    draw_sprite(sprite_index, 4, x - camx, y - camy);
    language_set_font(UnknownEnum.Value_0);
}

enum UnknownEnum
{
    Value_0
}
