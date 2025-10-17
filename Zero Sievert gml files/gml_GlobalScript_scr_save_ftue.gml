function scr_save_ftue()
{
    var _section_string = "ftue";
    db_open(_section_string);
    
    with (player_get_local())
    {
        db_write(_section_string, "part1_complete", ftue_part1_complete);
        db_write(_section_string, "part1_barman_player_walks_away", ftue_part1_barman_player_walks_away);
        db_write(_section_string, "part1_barman_player_takes_too_long", ftue_part1_barman_player_takes_too_long);
        db_write(_section_string, "part1_barman_player_takes_too_long_timer", ftue_part1_barman_player_takes_too_long_timer);
        db_write(_section_string, "part1_barman_player_spoken_to_barman", ftue_part1_barman_player_spoken_to_barman);
        db_write(_section_string, "part2_complete", ftue_part2_complete);
        db_write(_section_string, "part3_complete", ftue_part3_complete);
        db_write(_section_string, "part4_complete", ftue_part4_complete);
        db_write(_section_string, "part4_player_no_bullets_1", ftue_part4_player_no_bullets_1);
        db_write(_section_string, "part4_player_no_bullets_2", ftue_part4_player_no_bullets_2);
        db_write(_section_string, "part4_player_no_bullets_3", ftue_part4_player_no_bullets_3);
        db_write(_section_string, "part5_complete", ftue_part5_complete);
        db_write(_section_string, "part5_player_hurt", ftue_part5_player_hurt);
        db_write(_section_string, "part5_player_radiation", ftue_part5_player_radiation);
        db_write(_section_string, "part5_player_quest", ftue_part5_player_quest);
        db_write(_section_string, "part5_delay_timer", ftue_part5_delay_timer);
        db_write(_section_string, "part6_complete", ftue_part6_complete);
        db_write(_section_string, "part6_carrying_too_much", ftue_part6_carrying_too_much);
        db_write(_section_string, "part6_out_of_energy", ftue_part6_out_of_energy);
        db_write(_section_string, "part6_bleeding", ftue_part6_bleeding);
    }
    
    db_close();
}
