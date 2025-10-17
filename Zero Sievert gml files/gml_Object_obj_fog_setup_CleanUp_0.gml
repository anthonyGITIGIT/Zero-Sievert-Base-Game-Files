surface_free(surface_shadow);
surface_shadow = -1;

if (vb != undefined)
{
    vertex_delete_buffer(vb);
    vb = undefined;
}

if (vf != undefined)
{
    vertex_format_delete(vf);
    vf = undefined;
}
