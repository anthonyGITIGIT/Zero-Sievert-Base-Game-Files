function bullet_hit_solid(arg0, arg1)
{
    with (arg0)
    {
        var _impact = instance_create_depth(x, y, -y - 64, obj_bullet_hit_wall);
        _impact.impact_direction = point_direction(hspd, vspd, 0, 0);
        var _decor_id = arg1.decor_id;
        
        if (_decor_id >= 0)
        {
            if (variable_instance_exists(obj_controller, "decor_material"))
            {
                var _material = obj_controller.decor_material[_decor_id];
                
                if (_material != UnknownEnum.Value_0)
                {
                    _impact = instance_create_depth(x, y, 0, obj_bullet_impact);
                    _impact.sound_impact = global.bullet_impact[_material][irandom(array_length_2d(global.bullet_impact, _material) - 1)];
                }
            }
        }
        
        instance_destroy();
    }
}

enum UnknownEnum
{
    Value_0
}
