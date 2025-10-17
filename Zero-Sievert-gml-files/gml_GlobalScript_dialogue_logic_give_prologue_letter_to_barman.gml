function dialogue_logic_give_prologue_letter_to_barman()
{
    inventory_remove_item("prologue_letter", 1);
    var _amount = 10000;
    global.player_money += _amount;
    scr_draw_text_with_box("You have received 10000 Roubles");
    
    with (obj_tradr_bar)
    {
        text = undefined;
        lista_text();
    }
}
