global.general_debug = false;
global.show_fps = false;
global.slot_selected = 1;
global.strict_steam_mode = false;
global.is_steamdeck = false;
global.trace_to_file = false;
scan_for_log_to_file();
audio_listener_orientation(0, 1, 0, 0, 0, 1);
global.overlay_item = 
{
    weight_min: 0,
    weight_max: 2,
    money_min: 0,
    money_max: 10000,
    color_min: 65280,
    color_max: 255,
    color_overlay: [65280, 60927, 34815, 17663, 255]
};
init_globals();

function init_globals()
{
    global.shake = false;
    global.can_be_placed = false;
    global.can_be_splitted = false;
    global.craft_state = 0;
    global.craft_selected = -1;
}
