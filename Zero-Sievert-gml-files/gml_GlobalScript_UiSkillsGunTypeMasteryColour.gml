function UiSkillsGunTypeMasteryColour(arg0)
{
    with (player_get_local())
    {
        if (skills.get_data(arg0).value == 0)
            return 8421504;
        else
            return 9688723;
    }
}
