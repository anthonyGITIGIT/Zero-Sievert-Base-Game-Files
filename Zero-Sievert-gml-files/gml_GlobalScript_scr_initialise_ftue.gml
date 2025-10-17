function scr_initialise_ftue()
{
    var _section_string = "ftue";
    
    with (player_get_local())
    {
        ftue_part1_complete = db_read_ext(_section_string, _section_string, "part1_complete", 0);
        ftue_part1_barman_player_walks_away = db_read_ext(_section_string, _section_string, "part1_barman_player_walks_away", 0);
        ftue_part1_barman_player_takes_too_long = db_read_ext(_section_string, _section_string, "part1_barman_player_takes_too_long", 0);
        ftue_part1_barman_player_takes_too_long_timer = db_read_ext(_section_string, _section_string, "part1_barman_player_takes_too_long_timer", 0);
        ftue_part1_barman_player_spoken_to_barman = db_read_ext(_section_string, _section_string, "part1_barman_player_spoken_to_barman", 0);
        ftue_part2_complete = db_read_ext(_section_string, _section_string, "part2_complete", 0);
        ftue_part3_complete = db_read_ext(_section_string, _section_string, "part3_complete", 0);
        ftue_part4_complete = db_read_ext(_section_string, _section_string, "part4_complete", 0);
        ftue_part4_player_no_gun_1 = db_read_ext(_section_string, _section_string, "part4_player_no_gun_1", 0);
        ftue_part4_player_no_bullets_1 = db_read_ext(_section_string, _section_string, "part4_player_no_bullets_1", 0);
        ftue_part4_player_no_gun_2 = db_read_ext(_section_string, _section_string, "part4_player_no_gun_2", 0);
        ftue_part4_player_no_bullets_2 = db_read_ext(_section_string, _section_string, "part4_player_no_bullets_2", 0);
        ftue_part4_player_no_gun_3 = db_read_ext(_section_string, _section_string, "part4_player_no_gun_3", 0);
        ftue_part4_player_no_bullets_3 = db_read_ext(_section_string, _section_string, "part4_player_no_bullets_3", 0);
        ftue_part5_complete = db_read_ext(_section_string, _section_string, "part5_complete", 0);
        ftue_part5_player_hurt = db_read_ext(_section_string, _section_string, "part5_player_hurt", 0);
        ftue_part5_player_radiation = db_read_ext(_section_string, _section_string, "part5_player_radiation", 0);
        ftue_part5_player_quest = db_read_ext(_section_string, _section_string, "part5_player_quest", 0);
        ftue_part5_delay_timer = db_read_ext(_section_string, _section_string, "part5_delay_timer", 0);
        ftue_part6_complete = db_read_ext(_section_string, _section_string, "part6_complete", 0);
        ftue_part6_carrying_too_much = db_read_ext(_section_string, _section_string, "part6_carrying_too_much", 0);
        ftue_part6_out_of_energy = db_read_ext(_section_string, _section_string, "part6_out_of_energy", 0);
        ftue_part6_bleeding = db_read_ext(_section_string, _section_string, "part6_bleeding", 0);
        ftue_part3_conductor_far = false;
        ftue_part4_train_timer = 0;
    }
}
