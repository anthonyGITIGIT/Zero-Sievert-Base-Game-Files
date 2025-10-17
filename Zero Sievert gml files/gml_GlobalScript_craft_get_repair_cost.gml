function craft_get_repair_cost(arg0)
{
    var _struct = {};
    _struct.array_item[0] = "scrap_weapon";
    _struct.array_item[1] = "scrap_material";
    var _damage_pc = (100 - arg0.durability) / 100;
    var k_repair = 0.0075 * global.sk_k[UnknownEnum.Value_70];
    var k_repair_armor = 0.004 * global.sk_k[UnknownEnum.Value_70];
    var _value;
    
    if (item_fits_category(arg0.item, "armor"))
    {
        _struct.array_item[0] = "scrap_armor";
        _value = ceil(item_get_value(arg0.item) * k_repair_armor * _damage_pc);
    }
    else
    {
        _value = ceil(item_get_value(arg0.item) * k_repair * _damage_pc);
    }
    
    _struct.array_item_quantity[0] = _value;
    _struct.array_item_quantity[1] = ceil(_value * 0.4);
    return _struct;
}

enum UnknownEnum
{
    Value_70 = 70
}
