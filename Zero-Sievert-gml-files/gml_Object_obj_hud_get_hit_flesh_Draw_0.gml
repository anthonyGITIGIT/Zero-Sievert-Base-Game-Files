var _scale = camera_get_view_width(view_camera[0]) / 480;
draw_sprite_ext(sprite_index, image_index, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), _scale, _scale, 0, c_white, a);
