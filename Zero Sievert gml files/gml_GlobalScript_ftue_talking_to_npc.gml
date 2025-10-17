function ftue_talking_to_npc(arg0)
{
    if (arg0.npc_id == "barman")
    {
        ftue_part1_barman_player_walks_away = true;
        ftue_part1_barman_player_takes_too_long = true;
        ftue_part1_barman_player_spoken_to_barman = true;
    }
}
