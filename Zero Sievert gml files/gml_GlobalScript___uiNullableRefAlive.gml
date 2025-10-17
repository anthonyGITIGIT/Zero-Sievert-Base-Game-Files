function __uiNullableRefAlive(arg0)
{
    return arg0 != undefined && weak_ref_alive(arg0) && !(struct_get_from_hash(arg0.ref, variable_get_hash("__destroyed")) ?? false);
}
