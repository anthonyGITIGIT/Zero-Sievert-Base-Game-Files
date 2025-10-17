function scr_move_arma_random(arg0, arg1, arg2)
{
    var _chance = arg0;
    var _angle = arg1;
    var _k = arg2;
    
    if (scr_chance(_chance))
        weapon_pointing_amount = choose(-_angle, _angle, 0);
    
    weapon_pointing_direction += (weapon_pointing_amount * _k);
}
