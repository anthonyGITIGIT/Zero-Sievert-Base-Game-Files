function db_version_older_than(arg0, arg1, arg2, arg3)
{
    var _major = db_meta_read(arg0, "version_major", 1);
    var _minor = db_meta_read(arg0, "version_minor", 2);
    var _patch = db_meta_read(arg0, "version_patch", 24);
    
    if (is_string(arg1) || is_string(arg2) || is_string(arg3))
        return false;
    
    if (is_string(_major) || is_string(_minor) || is_string(_patch))
        return false;
    
    return _major < arg1 || (_major == arg1 && _minor < arg2) || (_major == arg1 && _minor == arg2 && _patch < arg3);
}
