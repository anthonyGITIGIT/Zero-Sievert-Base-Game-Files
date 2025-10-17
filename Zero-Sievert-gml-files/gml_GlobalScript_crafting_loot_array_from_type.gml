function crafting_loot_array_from_type(arg0)
{
    var _result_array = [];
    var _i = 0;
    
    repeat (array_length(global.craft_get))
    {
        var _craft_id = global.craft_get[_i];
        var _type = global.craft_type[_i];
        var _quantity = global.craft_get_n[_i];
        
        if (_type == UnknownEnum.Value_1 && global.sk_k[UnknownEnum.Value_76])
            _quantity = ceil(1.3 * _quantity);
        
        if (is_string(_craft_id) && _type == arg0 && _quantity > 0)
        {
            var _loot = new class_loot(_craft_id, _quantity);
            loot_add_crafting_data(_loot, global.craft_req_skill_id[_i], global.craft_req_skill_lvl[_i], global.craft_req_module_id[_i], global.craft_req_module_lvl[_i], global.craft_req[_i], global.craft_req_n[_i]);
            array_push(_result_array, _loot);
        }
        
        _i++;
    }
    
    return _result_array;
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_76 = 76
}
