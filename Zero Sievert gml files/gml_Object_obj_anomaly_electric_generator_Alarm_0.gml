raggio = obj_controller.place_radius[ano_id];
raggio_anomaly_fire = raggio / 2;
var xx, yy;

repeat (3)
{
    xx = irandom_range(-raggio_anomaly_fire * 16, raggio_anomaly_fire * 16);
    yy = irandom_range(-raggio_anomaly_fire * 16, raggio_anomaly_fire * 16);
    instance_create_depth(x + xx, y + yy, -y, obj_chest_cristallo_blu);
}

var _obj = instance_create_depth(x + xx, y + yy, -y, obj_enemy_anomaly_electric);
_obj.need_to_check = false;
