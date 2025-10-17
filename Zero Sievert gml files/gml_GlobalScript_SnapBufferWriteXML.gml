function SnapBufferWriteXML(arg0, arg1)
{
    var _prologStruct = struct_get_from_hash(arg1, variable_get_hash("prolog"));
    
    if (is_struct(_prologStruct))
    {
        var _attributeStruct = struct_get_from_hash(_prologStruct, variable_get_hash("attributes"));
        
        if (is_struct(_attributeStruct))
        {
            var _names = variable_struct_get_names(_attributeStruct);
            var _count = array_length(_names);
            
            if (_count > 0)
            {
                buffer_write(arg0, buffer_text, "<?xml");
                var _i = 0;
                
                repeat (_count)
                {
                    var _key = _names[_i];
                    var _value = variable_struct_get(_attributeStruct, _key);
                    buffer_write(arg0, buffer_text, " ");
                    buffer_write(arg0, buffer_text, _key);
                    buffer_write(arg0, buffer_text, "=\"");
                    buffer_write(arg0, buffer_text, string(_value));
                    buffer_write(arg0, buffer_text, "\"");
                    _i++;
                }
                
                buffer_write(arg0, buffer_text, "?>\n");
            }
        }
    }
    
    var _children = struct_get_from_hash(arg1, variable_get_hash("children"));
    
    if (is_array(_children))
    {
        var _i = 0;
        
        repeat (array_length(_children))
        {
            __SnapToXMLBufferInner(arg0, _children[_i], "");
            _i++;
        }
    }
}

function __SnapToXMLBufferInner(arg0, arg1, arg2)
{
    buffer_write(arg0, buffer_text, arg2);
    buffer_write(arg0, buffer_text, "<");
    buffer_write(arg0, buffer_text, arg1.type);
    var _attributeStruct = struct_get_from_hash(arg1, variable_get_hash("attributes"));
    
    if (is_struct(_attributeStruct))
    {
        var _names = variable_struct_get_names(_attributeStruct);
        var _i = 0;
        
        repeat (array_length(_names))
        {
            var _key = _names[_i];
            var _value = variable_struct_get(_attributeStruct, _key);
            buffer_write(arg0, buffer_text, " ");
            buffer_write(arg0, buffer_text, _key);
            buffer_write(arg0, buffer_text, "=\"");
            buffer_write(arg0, buffer_text, string(_value));
            buffer_write(arg0, buffer_text, "\"");
            _i++;
        }
    }
    
    buffer_write(arg0, buffer_text, ">");
    var _content = struct_get_from_hash(arg1, variable_get_hash("text"));
    
    if (_content != undefined)
    {
        buffer_write(arg0, buffer_text, string(_content));
    }
    else
    {
        var _children = struct_get_from_hash(arg1, variable_get_hash("children"));
        
        if (is_array(_children))
        {
            var _count = array_length(_children);
            
            if (_count > 0)
            {
                var _preIndent = arg2;
                arg2 += "\t";
                var _i = 0;
                
                repeat (_count)
                {
                    buffer_write(arg0, buffer_u8, 13);
                    __SnapToXMLBufferInner(arg0, _children[_i], arg2);
                    _i++;
                }
                
                arg2 = _preIndent;
                buffer_write(arg0, buffer_u8, 13);
                buffer_write(arg0, buffer_text, arg2);
            }
        }
    }
    
    buffer_write(arg0, buffer_text, "</");
    buffer_write(arg0, buffer_text, arg1.type);
    buffer_write(arg0, buffer_text, ">");
}
