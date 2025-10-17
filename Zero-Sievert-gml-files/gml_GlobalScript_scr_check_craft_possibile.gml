function scr_check_craft_possibile(arg0)
{
    var _craft_id = arg0;
    var _have_skill = false;
    var _have_module = false;
    var _dont_have_skill_lvl = false;
    var _req_skill_id = global.craft_req_skill_id[_craft_id];
    var _req_skill_lvl = global.craft_req_skill_lvl[_craft_id];
    var _req_module_id = global.craft_req_module_id[_craft_id];
    var _req_module_lvl = global.craft_req_module_lvl[_craft_id];
    
    if (_req_skill_id == false)
        _have_skill = true;
    
    if (_req_skill_id != false)
    {
        if (global.sk_lvl[_req_skill_id] >= _req_skill_lvl)
            _have_skill = true;
        else
            _dont_have_skill_lvl = true;
    }
    
    if (_req_module_id == -1)
        _have_module = true;
    
    if (_req_module_id != -1)
    {
        for (var i = 0; i < array_length_1d(global.sl_id); i++)
        {
            if (global.sl_base_id[i] == _req_module_id)
            {
                if (global.base_lvl[_req_module_id] >= _req_module_lvl)
                    _have_module = true;
            }
        }
    }
    
    var _array_return;
    _array_return[0] = _have_skill;
    _array_return[1] = _have_module;
    return _array_return;
}
