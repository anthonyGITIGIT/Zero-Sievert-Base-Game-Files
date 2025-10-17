if (damage_on_hit == true)
{
    if (npc_get_damage_melee(npc_id) > 0)
    {
        if (other.faction != faction)
        {
            if (other.hit == false)
            {
                other.hit = true;
                other.shader_hit = "BULLET_HIT_SHADER_NORMAL";
                other.alarm[2] = 3;
                other.alarm[4] = 30;
                other.alarm[1] = npc_get_damage_melee(npc_id) div 5;
                other.hp -= (npc_get_damage_melee(npc_id) / 2);
                scr_enemy_sound_attack();
            }
        }
    }
}
