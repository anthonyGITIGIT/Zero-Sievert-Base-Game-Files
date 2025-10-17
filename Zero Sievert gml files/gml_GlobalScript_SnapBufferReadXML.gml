function SnapBufferReadXML(arg0, arg1, arg2)
{
    var _oldOffset = buffer_tell(arg0);
    buffer_seek(arg0, buffer_seek_start, arg1);
    var _skip_whitespace = true;
    var _in_key = false;
    var _key_start = -1;
    var _key = "";
    var _in_value = false;
    var _in_string = false;
    var _string_start = 0;
    var _value = "";
    var _in_text = false;
    var _text = "";
    var _text_has_ampersand = false;
    var _text_start = 0;
    var _in_tag = false;
    var _tag = undefined;
    var _tag_terminating = false;
    var _tag_self_terminating = false;
    var _tag_is_prolog = false;
    var _tag_is_comment = false;
    _tag_terminating = false;
    var _tag_start = 0;
    var _tag_reading_attributes = false;
    var _tag_has_attributes = false;
    var _root = 
    {
        type: "root"
    };
    var _stack_parent = undefined;
    var _stack_top = _root;
    var _stack = ds_list_create();
    ds_list_add(_stack, _stack_top);
    
    repeat (arg2)
    {
        _value = buffer_read(arg0, buffer_u8);
        
        if (_skip_whitespace && _value > 32)
            _skip_whitespace = false;
        
        if (!_skip_whitespace)
        {
            if (_in_tag)
            {
                if (_in_key)
                {
                    if (_value == 47 || _value == 63)
                    {
                        _in_key = false;
                        
                        if (_value == 47)
                            _tag_terminating = true;
                    }
                    else if (_value == 32 || _value == 61)
                    {
                        buffer_poke(arg0, buffer_tell(arg0) - 1, buffer_u8, 0);
                        buffer_seek(arg0, buffer_seek_start, _key_start);
                        _key = buffer_read(arg0, buffer_string);
                        _in_key = false;
                        _in_value = true;
                    }
                    else if (_key_start < 0)
                    {
                        _key_start = buffer_tell(arg0) - 1;
                    }
                }
                else if (_in_value)
                {
                    if (_in_string)
                    {
                        if (_value == 38)
                        {
                            _text_has_ampersand = true;
                        }
                        else if (_value == 34)
                        {
                            buffer_poke(arg0, buffer_tell(arg0) - 1, buffer_u8, 0);
                            buffer_seek(arg0, buffer_seek_start, _string_start);
                            _value = buffer_read(arg0, buffer_string);
                            
                            if (_text_has_ampersand)
                            {
                                _value = string_replace_all(_value, "&lt;", "<");
                                _value = string_replace_all(_value, "&gt;", ">");
                                _value = string_replace_all(_value, "&amp;", "&");
                                _value = string_replace_all(_value, "&apos;", "'");
                                _value = string_replace_all(_value, "&quot;", "\"");
                            }
                            
                            if (!_tag_is_comment)
                            {
                                if (!variable_struct_exists(_stack_top, "attributes"))
                                    _stack_top.attributes = {};
                                
                                variable_struct_set(_stack_top.attributes, _key, _value);
                            }
                            
                            _in_key = true;
                            _key_start = -1;
                            _in_string = false;
                            _skip_whitespace = true;
                        }
                    }
                    else if (_value == 34)
                    {
                        _in_string = true;
                        _string_start = buffer_tell(arg0);
                    }
                }
                else
                {
                    switch (_value)
                    {
                        case 63:
                            if (buffer_tell(arg0) == (_tag_start + 1))
                                _tag_is_prolog = true;
                            
                            break;
                        
                        case 33:
                            if (buffer_tell(arg0) == (_tag_start + 1))
                                _tag_is_comment = true;
                            
                            break;
                        
                        case 47:
                            if (buffer_tell(arg0) == (_tag_start + 1))
                            {
                                _tag_terminating = true;
                            }
                            else if (_tag == undefined && buffer_tell(arg0) > _tag_start)
                            {
                                _tag_terminating = true;
                                buffer_poke(arg0, buffer_tell(arg0) - 1, buffer_u8, 0);
                                buffer_seek(arg0, buffer_seek_start, _tag_start);
                                _tag = buffer_read(arg0, buffer_string);
                                buffer_poke(arg0, buffer_tell(arg0) - 1, buffer_u8, _value);
                                _stack_top = 
                                {
                                    type: _tag
                                };
                                ds_list_insert(_stack, 0, _stack_top);
                                
                                if (!variable_struct_exists(_stack_parent, "children"))
                                    _stack_parent.children = [];
                                
                                array_push(_stack_parent.children, _stack_top);
                                _in_key = true;
                                _key_start = -1;
                                _tag_reading_attributes = true;
                                _skip_whitespace = true;
                            }
                            
                            break;
                        
                        case 32:
                            if (!_tag_is_prolog)
                            {
                                buffer_poke(arg0, buffer_tell(arg0) - 1, buffer_u8, 0);
                                buffer_seek(arg0, buffer_seek_start, _tag_start);
                                _tag = buffer_read(arg0, buffer_string);
                            }
                            
                            if (!_tag_is_comment && !_tag_terminating)
                            {
                                _stack_top = 
                                {
                                    type: _tag_is_prolog ? "prolog" : _tag
                                };
                                ds_list_insert(_stack, 0, _stack_top);
                                
                                if (_tag_is_prolog)
                                {
                                    _stack_parent.prolog = _stack_top;
                                }
                                else
                                {
                                    if (!variable_struct_exists(_stack_parent, "children"))
                                        _stack_parent.children = [];
                                    
                                    array_push(_stack_parent.children, _stack_top);
                                }
                            }
                            
                            _in_key = true;
                            _key_start = -1;
                            _tag_reading_attributes = true;
                            _skip_whitespace = true;
                            break;
                    }
                }
                
                if (!_in_string && _value == 62)
                {
                    if (!_tag_reading_attributes && !_tag_is_comment)
                    {
                        if (!_tag_is_prolog && _tag == undefined)
                        {
                            buffer_poke(arg0, buffer_tell(arg0) - 1, buffer_u8, 0);
                            buffer_seek(arg0, buffer_seek_start, _tag_start);
                            _tag = buffer_read(arg0, buffer_string);
                        }
                        
                        if (!_tag_terminating)
                        {
                            _stack_top = 
                            {
                                type: _tag_is_prolog ? "prolog" : _tag
                            };
                            ds_list_insert(_stack, 0, _stack_top);
                            
                            if (_tag_is_prolog)
                            {
                                _stack_parent.prolog = _stack_top;
                            }
                            else
                            {
                                if (!variable_struct_exists(_stack_parent, "children"))
                                    _stack_parent.children = [];
                                
                                array_push(_stack_parent.children, _stack_top);
                            }
                        }
                    }
                    
                    var _previous_value = buffer_peek(arg0, buffer_tell(arg0) - 2, buffer_u8);
                    
                    if (_previous_value == 63)
                    {
                        _tag_terminating = true;
                    }
                    else if (_previous_value == 47)
                    {
                        _tag_terminating = true;
                        _tag_self_terminating = true;
                    }
                    
                    if (!_tag_is_comment && (!_tag_self_terminating || _tag_reading_attributes))
                    {
                        if (_tag_terminating || _tag_is_prolog)
                        {
                            ds_list_delete(_stack, 0);
                            _stack_top = ds_list_find_value(_stack, 0);
                        }
                        else
                        {
                            _in_text = true;
                            _text_has_ampersand = false;
                            _text_start = buffer_tell(arg0);
                        }
                    }
                    
                    if (!_tag_is_comment || (_tag_is_comment && _previous_value == 45))
                    {
                        _tag = undefined;
                        _in_tag = false;
                        _in_key = false;
                        _in_value = false;
                    }
                }
            }
            else if (_value == 10 || _value == 13)
            {
                _in_text = false;
                _skip_whitespace = true;
            }
            else if (_value == 60)
            {
                if (_in_text)
                {
                    _in_text = false;
                    buffer_poke(arg0, buffer_tell(arg0) - 1, buffer_u8, 0);
                    buffer_seek(arg0, buffer_seek_start, _text_start);
                    _text = buffer_read(arg0, buffer_string);
                    _stack_top.text = _text;
                }
                
                _stack_parent = _stack_top;
                _in_tag = true;
                _tag_terminating = false;
                _tag_self_terminating = false;
                _tag_is_prolog = false;
                _tag_is_comment = false;
                _tag_terminating = false;
                _tag_reading_attributes = false;
                _tag_has_attributes = false;
                _tag_start = buffer_tell(arg0);
            }
        }
    }
    
    ds_list_destroy(_stack);
    buffer_seek(arg0, buffer_seek_start, _oldOffset);
    return _root;
}
