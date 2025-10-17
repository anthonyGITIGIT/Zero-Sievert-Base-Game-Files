event_inherited();
check_weapon_timer++;

if (check_weapon_timer >= check_weapon_timer_max)
{
    check_weapon_timer = 0;
    var esiste = false;
    var my_id = id;
    
    if (instance_exists(obj_npc_weapon))
    {
        with (obj_npc_weapon)
        {
            if (follow_id == my_id)
                esiste = true;
        }
    }
    
    if (esiste == false)
        alarm[9] = 1;
}
