function string_make_first_uppercase(arg0)
{
    str2 = string_char_at(arg0, 1);
    str2 = string_upper(str2);
    arg0 = string_delete(arg0, 1, 1);
    return string_insert(str2, arg0, 1);
}
