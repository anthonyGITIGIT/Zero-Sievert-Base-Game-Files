aim_point_x = x + lengthdir_x(20, current_time / 10);
aim_point_y = y + lengthdir_y(20, current_time / 10);
player_step_update_sprite();
player_step_update_building_exit();
player_puppet_execute_state();
player_step_handle_torch();
player_step_emission_riparato();
player_step_weapon_direction();
player_step_update_xscale();
