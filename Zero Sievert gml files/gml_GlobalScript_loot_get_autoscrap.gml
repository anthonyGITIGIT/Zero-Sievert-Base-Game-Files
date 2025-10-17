function loot_get_autoscrap(arg0)
{
    var _item = arg0.item;
    return !(item_get_category(_item) == "weapon" || item_get_category(_item) == "armor" || item_get_category(_item) == "w_mod");
}
