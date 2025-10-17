u_pos = shader_get_uniform(shd_fog_light, "u_pos");
u_pos2 = shader_get_uniform(shd_fog_shadow, "u_pos");
light_pos = shader_get_uniform(shd_fog_new, "lightPos");
cam_pos = shader_get_uniform(shd_fog_new, "camPos");
surf_w = 482;
surf_h = 272;
created_first_time = false;
surface_reset = true;
surface_shadow = surface_create(surf_w, surf_h);
global.angle_fow = 90;
global.field_of_view_x1 = 0;
global.field_of_view_y1 = 0;
global.field_of_view_x2 = 0;
global.field_of_view_y2 = 0;
global.fow_minimun_dis = 35;
fog_of_war = false;
intervallo_generate_vertex = 60;

if (!is_in_raid())
    alarm[0] = 2;

vertex_format_begin();
vertex_format_add_position_3d();
vf = vertex_format_end();
vb = undefined;
