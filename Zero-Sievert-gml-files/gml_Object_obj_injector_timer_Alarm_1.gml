global.injector_factor[UnknownEnum.Value_0] -= item_inj_get_max_hp(injector_id);
global.injector_factor[UnknownEnum.Value_1] -= item_inj_get_hp_regen(injector_id);
global.injector_factor[UnknownEnum.Value_2] -= item_inj_get_bleed_rec(injector_id);
global.injector_factor[UnknownEnum.Value_3] -= item_inj_get_bleed_immune(injector_id);
global.injector_factor[UnknownEnum.Value_4] -= item_inj_get_stamina_max(injector_id);
global.injector_factor[UnknownEnum.Value_5] -= item_inj_get_stamina_regen(injector_id);
global.injector_factor[UnknownEnum.Value_6] -= item_inj_get_max_weight(injector_id);
global.injector_factor[UnknownEnum.Value_7] -= item_inj_get_rad_regen(injector_id);
global.injector_factor[UnknownEnum.Value_8] -= item_inj_get_rad_def(injector_id);
global.injector_factor[UnknownEnum.Value_9] -= item_inj_get_hunger(injector_id);
global.injector_factor[UnknownEnum.Value_10] -= item_inj_get_hunger_regen(injector_id);
global.injector_factor[UnknownEnum.Value_11] -= item_inj_get_thirst(injector_id);
global.injector_factor[UnknownEnum.Value_12] -= item_inj_get_thirst_regen(injector_id);
var a = injector_id;

with (player_get_local())
{
    hp_max -= item_inj_get_max_hp(a);
    bleed_immune -= item_inj_get_bleed_immune(a);
    stamina_max -= item_inj_get_stamina_max(a);
    radiation_defence -= item_inj_get_rad_def(a);
}

instance_destroy();

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12
}
