function init_quest_state()
{
    global.quest_state = undefined;
    
    for (var i = 0; i < 30; i++)
        global.quest_state[i] = new class_quest_state();
    
    global.save_daily_quest = array_create(8, undefined);
}
