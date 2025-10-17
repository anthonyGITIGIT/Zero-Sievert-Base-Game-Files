function npc_dialogue_heal_wound()
{
    if (!player_exists_local())
        exit;
    
    var _player = player_get_local();
    var _price = npc_dialogue_get_heal_wound_price();
    
    if (global.player_money < _price)
    {
        scr_draw_text_with_box("Not enough roubles");
        exit;
    }
    
    trader_transfer_money(undefined, 0, _price);
    _player.wound = 0;
    scr_draw_text_with_box("You have been healed");
    audio_play_sound(snd_ui_click_text_npc, 9, false);
}
