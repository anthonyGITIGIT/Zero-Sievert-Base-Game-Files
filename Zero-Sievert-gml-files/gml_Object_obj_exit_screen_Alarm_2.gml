exp_numero = exp_numero_max;
can_go_hub = true;
var _xp_steps = 50;

while (xp_steps < _xp_steps)
{
    global.xp += (exp_numero_max / _xp_steps);
    scr_check_level();
    
    if (++xp_steps >= _xp_steps)
    {
        global.xp = floor(global.xp);
        can_go_hub = true;
    }
    
    if (exp_numero_max == 0)
        can_go_hub = true;
}
