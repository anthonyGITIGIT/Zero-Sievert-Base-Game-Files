if (is_in_raid())
{
    if (quest_is_active("place_CCTV_mall"))
        building_deserialize(r_i_mall_quest_place_cctv, x div 16, y div 16);
    
    if (quest_is_active("target_ga_mall_base"))
        building_deserialize(r_i_mall_quest_kill_target_ga, x div 16, y div 16);
    
    if (quest_is_complete("target_ga_mall_base"))
        building_deserialize(r_i_mall_cc_base, x div 16, y div 16);
    
    if (quest_is_active("kill_assassins"))
        building_deserialize(r_i_mall_quest_kill_target_ga, x div 16, y div 16);
    
    if (quest_is_complete("kill_assassins"))
        building_deserialize(r_i_mall_ga_base, x div 16, y div 16);
}
