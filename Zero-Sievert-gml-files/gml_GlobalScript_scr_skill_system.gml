function skill_system() constructor
{
    static create = function(arg0, arg1, arg2)
    {
        if (variable_struct_exists(skill_data, arg0))
            exit;
        
        variable_struct_set(skill_data, arg0, new skill_system_skill(arg0, arg1, arg2));
    };
    
    static reset_skills = function()
    {
        var _keys = variable_struct_get_names(skill_data);
        
        for (var i = 0; i < array_length(_keys); i++)
            variable_struct_get(skill_data, array_get(_keys, i)).value = 0;
    };
    
    static get_data = function(arg0)
    {
        if (!skill_exists(arg0))
            return false;
        
        return variable_struct_get(skill_data, arg0);
    };
    
    static get_value = function(arg0)
    {
        if (!skill_exists(arg0))
            return false;
        
        return variable_struct_get(skill_data, arg0).value;
    };
    
    static get_value_dec = function(arg0)
    {
        if (!skill_exists(arg0))
            return false;
        
        return variable_struct_get(skill_data, arg0).value / variable_struct_get(skill_data, arg0).value_max;
    };
    
    static increment = function(arg0)
    {
        if (!skill_exists(arg0))
            return false;
        
        variable_struct_get(skill_data, arg0).value = clamp(variable_struct_get(skill_data, arg0).value + 1, 0, variable_struct_get(skill_data, arg0).value_max);
        return true;
    };
    
    static decrement = function(arg0)
    {
        if (!skill_exists(arg0))
            return false;
        
        variable_struct_get(skill_data, arg0).value = clamp(variable_struct_get(skill_data, arg0).value - 1, 0, variable_struct_get(skill_data, arg0).value_max);
        return true;
    };
    
    static set = function(arg0, arg1)
    {
        if (!skill_exists(arg0))
            return false;
        
        variable_struct_get(skill_data, arg0).value = clamp(arg1, 0, variable_struct_get(skill_data, arg0).value_max);
        return true;
    };
    
    static get_meta_skill_mastery = function(arg0)
    {
        if (!skill_exists(arg0))
            return false;
        
        return struct_get_from_hash(variable_struct_get(skill_data, arg0), variable_get_hash("meta_skill_mastery"));
    };
    
    static delete_meta_skill_mastery = function(arg0, arg1)
    {
        if (!skill_exists(arg0))
            return false;
        
        return array_delete(struct_get_from_hash(variable_struct_get(skill_data, arg0), variable_get_hash("meta_skill_mastery")), arg1, 1);
    };
    
    static set_mastery = function(arg0, arg1, arg2)
    {
        if (!skill_exists(arg0))
            return false;
        
        var _needs_gun_type = undefined;
        
        with (player_get_local())
            _needs_gun_type = variable_struct_get(weapon_mastery.mastery_to_gun_lookup, arg1);
        
        array_push(struct_get_from_hash(variable_struct_get(skill_data, arg0), variable_get_hash("meta_skill_mastery")), 
        {
            gun_type: _needs_gun_type,
            mastery_type: arg1,
            mastery_pip: arg2
        });
        return true;
    };
    
    static save = function(arg0 = "skills")
    {
        var _skill_data = skill_data;
        
        with (player_get_local())
        {
            db_open("general");
            db_write("player", arg0, json_stringify(_skill_data));
            db_close();
        }
    };
    
    static load = function(arg0 = "skills")
    {
        var _skill_object = self;
        
        with (player_get_local())
        {
            db_open("general");
            _skill_object.skill_data = json_parse(db_read("player", arg0, "{}"));
            db_close();
        }
    };
    
    static save_exists = function(arg0 = "skills")
    {
        var _skills_exists = true;
        db_open("general");
        
        if (db_read("player", arg0, undefined) == undefined)
            _skills_exists = false;
        
        db_close();
        return _skills_exists;
    };
    
    static skill_exists = function(arg0)
    {
        if (is_undefined(variable_struct_get(skill_data, arg0)))
            return false;
        
        return true;
    };
    
    skill_data = {};
}

function skill_system_skill(arg0, arg1 = 0, arg2 = 1) constructor
{
    name = arg0;
    value = arg1;
    value_max = arg2;
    meta_skill_mastery = [];
}

function skill_mastery_weapon(arg0) constructor
{
    static add_gun_type = function(arg0, arg1, arg2)
    {
        variable_struct_set(gun_to_mastery_lookup, arg0, arg1);
        variable_struct_set(mastery_to_gun_lookup, arg1, arg0);
        variable_struct_set(mastery_data, arg1, {});
        var _count_of_data_to_insert = array_length(arg2);
        
        for (var i = 0; i < _count_of_data_to_insert; i++)
        {
            var _this_data = arg2[i];
            variable_struct_set(variable_struct_get(mastery_data, arg1), _this_data.stat_enum_id, _this_data);
        }
    };
    
    static get_mastery_bonus = function(arg0, arg1)
    {
        if (is_undefined(arg0))
            return 1;
        
        if (is_undefined(arg1))
            return 1;
        
        if (variable_struct_exists(gun_to_mastery_lookup, arg0))
        {
            var _gun_mastery_str = variable_struct_get(gun_to_mastery_lookup, arg0);
            var _this_mastery_data = variable_struct_get(variable_struct_get(mastery_data, _gun_mastery_str), arg1);
            
            if (is_undefined(_this_mastery_data))
                return 1;
            
            return lerp(_this_mastery_data.worst_dec, _this_mastery_data.best_dec, my_skill_system.get_value_dec(_gun_mastery_str));
        }
        else
        {
            return 1;
        }
    };
    
    static get_mastery_name_and_value_array = function(arg0)
    {
        var _gun_type = variable_struct_get(mastery_to_gun_lookup, arg0);
        var _all_data = variable_struct_get(mastery_data, arg0);
        var _keys = variable_struct_get_names(_all_data);
        var _to_return = [];
        
        for (var i = 0; i < array_length(_keys); i++)
        {
            var _name = variable_struct_get(_all_data, array_get(_keys, i)).stat_enum_id;
            var _value = get_mastery_bonus(_gun_type, _name);
            array_push(_to_return, 
            {
                name: _name,
                value: _value
            });
        }
        
        return _to_return;
    };
    
    static get_mastery_final_pip_dec = function(arg0)
    {
        var _gun_type_string = variable_struct_get(mastery_to_gun_lookup, arg0);
        
        with (player_get_local())
        {
            var _current_exp_of_gun = stat_get_value(_gun_type_string + "_exp") + (variable_global_get(_gun_type_string + "_exp") * difficulty_get("pro_exp_multiplier"));
            var _arr_exp_total = global.skills_masteries_data.exp_rank.total;
            
            for (var i = 0; i < array_length(_arr_exp_total); i++)
            {
                if ((_current_exp_of_gun div _arr_exp_total[i]) == 0)
                {
                    var _level = i - 1;
                    _level = clamp(_level, 0, 15);
                    var _exp_on_this_level = _current_exp_of_gun - _arr_exp_total[_level];
                    var _exp_for_whole_level = _arr_exp_total[i] - _arr_exp_total[_level];
                    var _dec_to_level_up = _exp_on_this_level / _exp_for_whole_level;
                    
                    if (_dec_to_level_up < 0)
                        return 1 - map_value(_exp_on_this_level, 0, _arr_exp_total[0], 0, -1);
                    
                    return _dec_to_level_up;
                }
            }
        }
    };
    
    gun_to_mastery_lookup = {};
    mastery_to_gun_lookup = {};
    mastery_data = {};
    my_skill_system = arg0;
}

function skill_mastery_rank(arg0, arg1 = 1, arg2 = 1) constructor
{
    stat_enum_id = arg0;
    worst_dec = arg1;
    best_dec = arg2;
}

function mastery_to_ability_data(arg0, arg1, arg2) constructor
{
    ability_string = arg2;
    mastery_string = arg0;
    rank = arg1;
}

function mastery_to_ability_joining_table(arg0) constructor
{
    static add_ability = function(arg0, arg1, arg2)
    {
        array_push(ability_data, new mastery_to_ability_data(arg0, arg1, arg2));
    };
    
    static get_abilities = function(arg0, arg1)
    {
        var _count_abilities = array_length(ability_data);
        var _to_return = [];
        
        for (var i = 0; i < _count_abilities; i++)
        {
            var _this_ability = ability_data[i];
            
            if (_this_ability.mastery_string == arg0 && (_this_ability.rank - 1) <= arg1)
                array_push(_to_return, _this_ability.ability_string);
        }
        
        return _to_return;
    };
    
    static get_abilities_array_count = function(arg0)
    {
        var _count_abilities = array_length(ability_data);
        var _to_return = array_create(my_skill_system.get_data(arg0).value_max, 0);
        
        for (var i = 0; i < _count_abilities; i++)
        {
            var _this_ability = ability_data[i];
            
            if (_this_ability.mastery_string == arg0)
            {
                if (_this_ability.rank >= array_length(_to_return))
                    _to_return[_this_ability.rank - 1] = 1;
                else
                    _to_return[_this_ability.rank - 1]++;
            }
        }
        
        return _to_return;
    };
    
    my_skill_system = arg0;
    ability_data = [];
}
