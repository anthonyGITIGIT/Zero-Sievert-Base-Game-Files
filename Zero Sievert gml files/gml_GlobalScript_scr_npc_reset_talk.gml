function scr_npc_reset_talk(arg0 = false, arg1 = 120)
{
    can_talk = false;
    can_talk_reset = arg0;
    can_talk_reset_timer_max = arg1;
    can_talk_reset_timer = 0;
}
