function item_exists(arg0)
{
    return is_string(arg0) && arg0 != undefined && arg0 != "no_item" && arg0 != "no_weapon";
}
