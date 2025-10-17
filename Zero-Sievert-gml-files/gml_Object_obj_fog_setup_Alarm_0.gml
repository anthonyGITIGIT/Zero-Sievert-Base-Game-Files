var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var _generation_delay = intervallo_generate_vertex;

if (instance_exists(obj_train))
{
    if (obj_train.state == UnknownEnum.Value_6 && obj_train.spd_now != 0)
        _generation_delay = 1;
}

if (!settings_get("fog of war"))
{
    fog_of_war = false;
}
else
{
    if (vb != undefined)
    {
        vertex_delete_buffer(vb);
        vb = undefined;
    }
    
    vb = vertex_create_buffer();
    vertex_begin(vb, vf);
    var _vb = vb;
    var _solid_trovati = false;
    
    with (obj_solid)
    {
        if (distance_to_object(obj_controller) < 320)
        {
            _solid_trovati = true;
            var x1 = bbox_left;
            var y1 = bbox_top;
            var x2 = bbox_right;
            var y2 = bbox_bottom;
            scr_quad(_vb, x1, y1, x2, y1);
            scr_quad(_vb, x1, y1, x1, y2);
            scr_quad(_vb, x2, y1, x2, y2);
            scr_quad(_vb, x1, y2, x2, y2);
        }
    }
    
    vertex_end(vb);
    
    if (_solid_trovati)
    {
        fog_of_war = true;
        alarm[1] = 5;
    }
    else
    {
        fog_of_war = false;
    }
}

alarm[0] = _generation_delay;

enum UnknownEnum
{
    Value_6 = 6
}
