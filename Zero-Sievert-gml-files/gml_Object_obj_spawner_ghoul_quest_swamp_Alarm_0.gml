alarm[0] = 8;

if (amount > (amount_max - 25))
    alarm[0] = 1;

if (amount < (amount_max / 2) && amount > ((amount_max / 2) - 25))
    alarm[0] = 1;

if (amount > 0)
{
    var ss = instance_create_depth(x + irandom_range(-32, 32), y + irandom(16), 0, obj_enemy_ghoul);
    ss.alarm[6] = 2;
    amount -= 1;
    
    if (amount <= 2)
        can_finish = true;
}
