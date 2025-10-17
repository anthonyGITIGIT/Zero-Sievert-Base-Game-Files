function hotfix_chest_clean_up_all_positions()
{
    var _c = 0;
    
    repeat (db_read_ext("chest", "Storage", "slot now", 2))
    {
        var _loot_array = db_read_ext("chest", "chest_" + string(_c), "items", []);
        var _i = 0;
        
        repeat (array_length(_loot_array))
        {
            var _loot = _loot_array[_i];
            
            if (variable_struct_exists(_loot, "placement"))
            {
                continue;
                _i++;
            }
            
            var _fixed_position = chest_clean_up_position(_loot.x, _loot.y);
            _loot.x = _fixed_position.x;
            _loot.y = _fixed_position.y;
            _i++;
        }
        
        _c++;
    }
}
