function SnapBufferReadMessagePack(arg0, arg1)
{
    var _oldOffset = buffer_tell(arg0);
    buffer_seek(arg0, buffer_seek_start, arg1);
    var _value = __SnapFromMessagepackValue(arg0);
    buffer_seek(arg0, buffer_seek_start, _oldOffset);
    return _value;
}

function __SnapFromMessagepackValue(arg0)
{
    var _byte = buffer_read(arg0, buffer_u8);
    
    if (_byte <= 127)
    {
        return int64(_byte & 127);
    }
    else if (_byte <= 143)
    {
        return __SnapFromMessagepackStruct(arg0, _byte & 15);
    }
    else if (_byte <= 159)
    {
        return __SnapFromMessagepackArray(arg0, _byte & 15);
    }
    else if (_byte <= 191)
    {
        return __SnapFromMessagepackString(arg0, _byte & 31);
    }
    else if (_byte >= 224 && _byte <= 255)
    {
        return (_byte & 31) - 32;
    }
    else
    {
        switch (_byte)
        {
            case 192:
                return undefined;
                break;
            
            case 193:
                trace("SnapBufferReadMessagePack(): Warning! Datatype 0xC1 found, but this value should never be used");
                break;
            
            case 194:
                return bool(false);
                break;
            
            case 195:
                return bool(true);
                break;
            
            case 196:
                return __SnapFromMessagepackBin(arg0, buffer_read(arg0, buffer_u8));
                break;
            
            case 197:
                return __SnapFromMessagepackBin(arg0, __SnapFromMessagepackLittleEndian(arg0, 3));
                break;
            
            case 198:
                return __SnapFromMessagepackBin(arg0, __SnapFromMessagepackLittleEndian(arg0, 5));
                break;
            
            case 199:
                return __SnapFromMessagepackExt(arg0, buffer_read(arg0, buffer_u8));
                break;
            
            case 200:
                return __SnapFromMessagepackExt(arg0, __SnapFromMessagepackLittleEndian(arg0, 3));
                break;
            
            case 201:
                return __SnapFromMessagepackExt(arg0, __SnapFromMessagepackLittleEndian(arg0, 5));
                break;
            
            case 202:
                return __SnapFromMessagepackLittleEndian(arg0, 8);
                break;
            
            case 203:
                return __SnapFromMessagepackLittleEndian(arg0, 9);
                break;
            
            case 204:
                return buffer_read(arg0, buffer_u8);
                break;
            
            case 205:
                return __SnapFromMessagepackLittleEndian(arg0, 3);
                break;
            
            case 206:
                return __SnapFromMessagepackLittleEndian(arg0, 5);
                break;
            
            case 207:
                return __SnapFromMessagepackLittleEndian(arg0, 12);
                break;
            
            case 208:
                return buffer_read(arg0, buffer_s8);
                break;
            
            case 209:
                return __SnapFromMessagepackLittleEndian(arg0, 4);
                break;
            
            case 210:
                return __SnapFromMessagepackLittleEndian(arg0, 6);
                break;
            
            case 211:
                return __SnapFromMessagepackLittleEndian(arg0, 12);
                break;
            
            case 212:
                return __SnapFromMessagepackExt(arg0, 1);
                break;
            
            case 213:
                return __SnapFromMessagepackExt(arg0, 2);
                break;
            
            case 214:
                return __SnapFromMessagepackExt(arg0, 4);
                break;
            
            case 215:
                return __SnapFromMessagepackExt(arg0, 8);
                break;
            
            case 216:
                return __SnapFromMessagepackExt(arg0, 16);
                break;
            
            case 217:
                return __SnapFromMessagepackString(arg0, buffer_read(arg0, buffer_u8));
                break;
            
            case 218:
                return __SnapFromMessagepackString(arg0, __SnapFromMessagepackLittleEndian(arg0, 3));
                break;
            
            case 219:
                return __SnapFromMessagepackString(arg0, __SnapFromMessagepackLittleEndian(arg0, 5));
                break;
            
            case 220:
                return __SnapFromMessagepackArray(arg0, __SnapFromMessagepackLittleEndian(arg0, 3));
                break;
            
            case 221:
                return __SnapFromMessagepackArray(arg0, __SnapFromMessagepackLittleEndian(arg0, 5));
                break;
            
            case 222:
                return __SnapFromMessagepackStruct(arg0, __SnapFromMessagepackLittleEndian(arg0, 3));
                break;
            
            case 223:
                return __SnapFromMessagepackStruct(arg0, __SnapFromMessagepackLittleEndian(arg0, 5));
                break;
            
            default:
                trace("SnapBufferReadMessagePack(): Warning! Unsupported datatype " + string(_byte) + " found");
                break;
        }
    }
}

function __SnapFromMessagepackStruct(arg0, arg1)
{
    var _struct = {};
    
    repeat (arg1)
    {
        var _key = __SnapFromMessagepackValue(arg0);
        variable_struct_set(_struct, _key, __SnapFromMessagepackValue(arg0));
    }
    
    return _struct;
}

function __SnapFromMessagepackArray(arg0, arg1)
{
    var _array = array_create(arg1, undefined);
    var _i = 0;
    
    repeat (arg1)
    {
        _array[_i] = __SnapFromMessagepackValue(arg0);
        _i++;
    }
    
    return _array;
}

function __SnapFromMessagepackString(arg0, arg1)
{
    if (arg1 == 0)
        return "";
    
    var _nullPosition = buffer_tell(arg0) + arg1;
    
    if (_nullPosition >= buffer_get_size(arg0))
        return buffer_read(arg0, buffer_text);
    
    var _peek = buffer_peek(arg0, _nullPosition, buffer_u8);
    buffer_poke(arg0, _nullPosition, buffer_u8, 0);
    var _string = buffer_read(arg0, buffer_string);
    buffer_seek(arg0, buffer_seek_relative, -1);
    buffer_poke(arg0, _nullPosition, buffer_u8, _peek);
    return _string;
}

function __SnapFromMessagepackBin(arg0, arg1)
{
    var _array = array_create(arg1);
    var _i = 0;
    
    repeat (arg1)
    {
        _array[_i] = buffer_read(arg0, buffer_u8);
        _i++;
    }
    
    return 
    {
        messagepackDatatype: "bin",
        data: _array
    };
}

function __SnapFromMessagepackExt(arg0, arg1)
{
    var _type = buffer_read(arg0, buffer_s8);
    var _array = array_create(arg1);
    var _i = 0;
    
    repeat (arg1)
    {
        _array[_i] = buffer_read(arg0, buffer_u8);
        _i++;
    }
    
    return 
    {
        messagepackDatatype: "ext",
        type: _type,
        data: _array
    };
}

function __SnapFromMessagepackLittleEndian(arg0, arg1)
{
    static _flipBuffer = buffer_create(8, buffer_fixed, 1);
    
    switch (buffer_sizeof(arg1))
    {
        case 1:
            return buffer_read(arg0, arg1);
            break;
        
        case 2:
            buffer_poke(_flipBuffer, 1, buffer_u8, buffer_read(arg0, buffer_u8));
            buffer_poke(_flipBuffer, 0, buffer_u8, buffer_read(arg0, buffer_u8));
            break;
        
        case 4:
            buffer_poke(_flipBuffer, 3, buffer_u8, buffer_read(arg0, buffer_u8));
            buffer_poke(_flipBuffer, 2, buffer_u8, buffer_read(arg0, buffer_u8));
            buffer_poke(_flipBuffer, 1, buffer_u8, buffer_read(arg0, buffer_u8));
            buffer_poke(_flipBuffer, 0, buffer_u8, buffer_read(arg0, buffer_u8));
            break;
        
        case 8:
            buffer_poke(_flipBuffer, 7, buffer_u8, buffer_read(arg0, buffer_u8));
            buffer_poke(_flipBuffer, 6, buffer_u8, buffer_read(arg0, buffer_u8));
            buffer_poke(_flipBuffer, 5, buffer_u8, buffer_read(arg0, buffer_u8));
            buffer_poke(_flipBuffer, 4, buffer_u8, buffer_read(arg0, buffer_u8));
            buffer_poke(_flipBuffer, 3, buffer_u8, buffer_read(arg0, buffer_u8));
            buffer_poke(_flipBuffer, 2, buffer_u8, buffer_read(arg0, buffer_u8));
            buffer_poke(_flipBuffer, 1, buffer_u8, buffer_read(arg0, buffer_u8));
            buffer_poke(_flipBuffer, 0, buffer_u8, buffer_read(arg0, buffer_u8));
            break;
    }
    
    return buffer_peek(_flipBuffer, 0, arg1);
}
