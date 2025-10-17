function scr_ga_get_name(arg0)
{
    var _item_id = arg0;
    var _name = item_get_name(_item_id);
    var _new_name = string_replace_all(_name, " ", "_");
    return _new_name;
}
