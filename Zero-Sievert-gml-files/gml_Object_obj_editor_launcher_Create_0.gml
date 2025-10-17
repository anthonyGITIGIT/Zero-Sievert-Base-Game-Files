var _rooms_array = tag_get_asset_ids("building template", 3);
array_sort(_rooms_array, true);
room_goto(_rooms_array[0]);
