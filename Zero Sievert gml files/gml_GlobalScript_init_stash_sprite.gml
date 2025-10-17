function create_stash_sprite(arg0 = "", arg1) constructor
{
    name = arg0;
    sprite = arg1;
}

global.stash_sprite_database = [new create_stash_sprite("none", s_hud_stash_sprite_none), new create_stash_sprite("Medications", s_hud_stash_sprite_med), new create_stash_sprite("Ammo", s_hud_stash_sprite_ammo), new create_stash_sprite("Ammo", s_hud_stash_sprite_ammo2), new create_stash_sprite("Junk", s_hud_stash_sprite_junk), new create_stash_sprite("Food", s_hud_stash_sprite_food), new create_stash_sprite("Scrap", s_hud_stash_sprite_scrap), new create_stash_sprite("Armors", s_hud_stash_sprite_armor), new create_stash_sprite("Weapons", s_hud_stash_sprite_weapon), new create_stash_sprite("Keys", s_hud_stash_sprite_keys), new create_stash_sprite("Grenades", s_hud_stash_sprite_grenade), new create_stash_sprite("Valuables", s_hud_stash_sprite_valuables), new create_stash_sprite("Injectors", s_hud_stash_sprite_injector)];
