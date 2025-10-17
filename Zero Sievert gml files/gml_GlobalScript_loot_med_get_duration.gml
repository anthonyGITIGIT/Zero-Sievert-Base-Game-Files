function loot_med_get_duration(arg0)
{
    return item_med_get_duration(arg0.item) / global.sk_k[UnknownEnum.Value_29];
}

enum UnknownEnum
{
    Value_29 = 29
}
