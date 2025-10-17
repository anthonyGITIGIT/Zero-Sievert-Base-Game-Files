if (instance_exists(obj_prologue))
{
    if (obj_prologue.state == UnknownEnum.Value_23)
        instance_destroy();
}

enum UnknownEnum
{
    Value_23 = 23
}
