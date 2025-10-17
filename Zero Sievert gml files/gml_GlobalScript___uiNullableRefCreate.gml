function __uiNullableRefCreate(arg0)
{
    if (!is_struct(arg0))
        return undefined;
    
    if (struct_get_from_hash(arg0, variable_get_hash("__destroyed")) ?? false)
        return undefined;
    
    return weak_ref_create(arg0);
}
