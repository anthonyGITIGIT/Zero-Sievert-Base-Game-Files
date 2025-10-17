function init_npc_marker()
{
    arr_npc_marker = [];
    array_push(arr_npc_marker, new npc_marker(590, 872, "Barman"));
    array_push(arr_npc_marker, new npc_marker(985, 1000, "Doctor"));
    array_push(arr_npc_marker, new npc_marker(480, 1026, "Networker"));
    array_push(arr_npc_marker, new npc_marker(304, 570, "Green Army"));
    array_push(arr_npc_marker, new npc_marker(768, 806, "Crimson Corporation"));
    array_push(arr_npc_marker, new npc_marker(702, 1334, "Train"));
}

function npc_marker(arg0, arg1, arg2) constructor
{
    x = arg0;
    y = arg1;
    text = arg2;
    draw_x = 0;
    draw_y = 0;
}
