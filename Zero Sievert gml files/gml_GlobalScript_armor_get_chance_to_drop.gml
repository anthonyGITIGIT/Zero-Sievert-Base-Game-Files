function armor_get_chance_to_drop(arg0)
{
    var _armor_class = item_armor_get_class(arg0);
    
    switch (_armor_class)
    {
        case 0:
        case 1:
        case 2:
        case 3:
            return difficulty_get("armor_class_03_chance");
            break;
        
        case 4:
            return difficulty_get("armor_class_4_chance");
            break;
        
        case 5:
            return difficulty_get("armor_class_5_chance");
            break;
        
        case 6:
            return difficulty_get("armor_class_6_chance");
            break;
    }
    
    return 100;
}
