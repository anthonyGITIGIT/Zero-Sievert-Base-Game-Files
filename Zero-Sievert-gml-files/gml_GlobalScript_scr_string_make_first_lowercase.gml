function string_make_first_lowercase(arg0)
{
    str2 = string_char_at(arg0, 1);
    str2 = string_lower(str2);
    arg0 = string_delete(arg0, 1, 1);
    return string_insert(str2, arg0, 1);
}
