if (hp_set == false)
{
    hp *= difficulty_get("enemy_mutant_hp");
    hp = clamp(hp, 1, 99999);
    hp_set = true;
}

event_inherited();
