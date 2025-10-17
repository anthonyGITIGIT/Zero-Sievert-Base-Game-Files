function show_bullet_damage(arg0, arg1, arg2)
{
    if (!is_in_shooting_range())
        exit;
    
    var _show_chance = instance_create_depth(arg0.x, arg0.y - 30, -9999, obj_damage_bullet);
    _show_chance.dmg = arg1;
    _show_chance.text = "Dmg:";
    _show_chance = instance_create_depth(arg0.x, arg0.y - 40, -9999, obj_damage_bullet);
    _show_chance.dmg = arg2;
    _show_chance.text = "Pen%";
    _show_chance.round_value = true;
}
