function npc_dialogue_quest_populate_task_rewards(arg0)
{
    uiFind(uiCurrentRoot(), "reward inventory").PopulateTaskRewards(arg0);
}
