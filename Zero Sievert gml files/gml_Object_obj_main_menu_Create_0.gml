if (global.coming_from_main_menu)
{
    global.coming_from_main_menu = false;
    black_overlay_alpha = 1;
}
else
{
    black_overlay_alpha = 0;
}

keybind_active = false;
keybind_target = undefined;
audio_group_load(snd_assault_rifle);
settings_apply("master volume");
settings_apply("radiation volume");
settings_apply("heart volume");
settings_apply("main volume");
settings_apply("ui rad button volume");

if (room == r_menu)
{
    mm_init_slot_metadata();
}
else
{
    play_time = array_create(3, 0);
    most_recent_save = global.slot_selected;
}

stop_video = true;
button_color_white = 15066597;
color_same_title = 4259071;
c_hover = 6271986;
scr_aggiorna_save_slot(global.slot_selected);
db_load("shared");
difficulty_set_sandbox(true);
difficulty_sandbox_load();
init_globals();
scr_area_data();
lista_skill_2();
lista_base();
camera_set_view_size(view_camera[0], 480, 270);

with (uiGetData())
{
    most_recent_save = other.most_recent_save;
    start_sidebar_path = (room == r_menu) ? "ZS_vanilla/ui/mm_sidebar_main.ui" : "ZS_vanilla/ui/mm_sidebar_pause.ui";
}

__uiGlobal().__defaultOnion.Clear();
var _root = uiFileExecute("ZS_vanilla/ui/mm_root.ui");
__uiGlobal().__defaultOnion.LayerAddTop(_root, "root");
uiInputButtonConsume(_root, "pause");
uiFind(_root, "main frame").ReplaceFromFile("ZS_vanilla/ui/mm_sidebar.ui");
uiFind(_root, "sidebar frame").ReplaceFromFile(uiGetData().start_sidebar_path);
alarm[3] = 3;

if (global.database_cloud_conflict != 0)
{
    uiGetData().cloud_conflict = global.database_cloud_conflict;
    __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/modal_cloud_conflict.ui", "cloud conflict");
}

if (db_read_ext("local settings", "game_version", "version", concat(1, ".", 2, ".", 24)) != concat(1, ".", 2, ".", 24))
    __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/modal_update.ui", "game update");

keyb_starty = 65;
keyb_t_startx = 50;
keyb_k_startx = 190;
keyb_offset_w = 220;
keyb_n_fila = 12;
keyb_w = 64;
keyb_h = 10;
keyb_sep = 11;
wait_input = false;
key_selected = 0;
scr_load_key_bindings();
window_focused = game_in_focus();
new_version = false;
new_version_close_x = 399;
new_version_close_y = 50;
new_version_close_w = 16;
db_open("local settings");
new_version = db_read("game_version", "version", concat(1, ".", 2, ".", 24)) != concat(1, ".", 2, ".", 24);
db_write("game_version", "version", concat(1, ".", 2, ".", 24));

if (global.database_cloud_conflict == 0)
    db_write("cloud", "using_cloud", db_cloud_enabled());

db_close();
scr_load_key_bindings();
window_focused = game_in_focus();
instance_create_depth(0, 0, 0, ugc_steamworks_checker);
