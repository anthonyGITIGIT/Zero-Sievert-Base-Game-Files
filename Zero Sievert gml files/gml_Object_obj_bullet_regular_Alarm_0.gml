visible = true;

with (player_get_local())
{
    if (skill_active("empowered_backup") && frames_since_last_swap_weapon <= global.skills_data.empowered_backup.value_2)
        other.draw_colour = 255;
    
    if (skill_active("first_bullet") && player_loadout_get_ammo(self, weapon_slot_now) >= (player_loadout_get_magazine_size(self, weapon_slot_now) - 1))
        other.draw_colour = 255;
    
    if (skill_active("suppressive_fire") && shooting_frames >= global.skills_data.suppressive_fire.value_2)
        other.draw_colour = 255;
}
