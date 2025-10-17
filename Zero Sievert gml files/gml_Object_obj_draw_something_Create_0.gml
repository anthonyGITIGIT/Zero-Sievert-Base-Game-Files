t = "";
alarm[0] = 190;
alarm[1] = 1;
audio_play_sound(snd_ui_pop_up_text, 9, false);
bb_w = min(string_width(t) + 14, 464);
bb_h = 18;
draw_x = 480 - bb_w - 8;
draw_y = 270 + bb_h;
draw_y_limit = 270 - bb_h - 8;
