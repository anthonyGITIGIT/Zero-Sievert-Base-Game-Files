function instance_get_unique_number(arg0)
{
    var _my_object = arg0.object_index;
    var _array_of_other_objects = [];
    
    with (_my_object)
        array_push(_array_of_other_objects, string(real(id)));
    
    array_sort(_array_of_other_objects, true);
    var _count_of_friends = array_length(_array_of_other_objects);
    
    for (var i = 0; i < _count_of_friends; i++)
    {
        if (_array_of_other_objects[i] == string(real(arg0.id)))
            return i;
    }
}
