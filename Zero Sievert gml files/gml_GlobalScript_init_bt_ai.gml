function init_bt_ai_human()
{
    var i = 0;
    tree_id[i] = UnknownEnum.Value_23;
    tree_parent[i] = 2;
    tree_pos[i] = 0;
    tree_child[i] = [];
    i = 1;
    tree_id[i] = UnknownEnum.Value_13;
    tree_parent[i] = 2;
    tree_pos[i] = 1;
    tree_child[i] = [];
    i = 2;
    tree_id[i] = UnknownEnum.Value_1;
    tree_parent[i] = 6;
    tree_pos[i] = 2;
    tree_child[i] = [1, 0];
    i = 3;
    tree_id[i] = UnknownEnum.Value_21;
    tree_parent[i] = 6;
    tree_pos[i] = 3;
    tree_child[i] = [];
    i = 4;
    tree_id[i] = UnknownEnum.Value_4;
    tree_parent[i] = 6;
    tree_pos[i] = 4;
    tree_child[i] = [5];
    i = 5;
    tree_id[i] = UnknownEnum.Value_12;
    tree_parent[i] = 4;
    tree_pos[i] = 5;
    tree_child[i] = [];
    i = 6;
    tree_id[i] = UnknownEnum.Value_2;
    tree_parent[i] = 9;
    tree_pos[i] = 6;
    tree_child[i] = [4, 2, 3];
    i = 7;
    tree_id[i] = UnknownEnum.Value_4;
    tree_parent[i] = 8;
    tree_pos[i] = 7;
    tree_child[i] = [23];
    i = 8;
    tree_id[i] = UnknownEnum.Value_2;
    tree_parent[i] = 21;
    tree_pos[i] = 8;
    tree_child[i] = [7, 22];
    i = 9;
    tree_id[i] = UnknownEnum.Value_1;
    tree_parent[i] = 29;
    tree_pos[i] = 9;
    tree_child[i] = [11, 6];
    i = 10;
    tree_id[i] = UnknownEnum.Value_4;
    tree_parent[i] = 25;
    tree_pos[i] = 10;
    tree_child[i] = [18];
    i = 11;
    tree_id[i] = UnknownEnum.Value_2;
    tree_parent[i] = 9;
    tree_pos[i] = 11;
    tree_child[i] = [24, 21];
    i = 12;
    tree_id[i] = UnknownEnum.Value_2;
    tree_parent[i] = 30;
    tree_pos[i] = 12;
    tree_child[i] = [29, 13];
    i = 13;
    tree_id[i] = UnknownEnum.Value_18;
    tree_parent[i] = 12;
    tree_pos[i] = 13;
    tree_child[i] = [];
    i = 14;
    tree_id[i] = UnknownEnum.Value_25;
    tree_parent[i] = 29;
    tree_pos[i] = 14;
    tree_child[i] = [];
    i = 15;
    tree_id[i] = UnknownEnum.Value_24;
    tree_parent[i] = 17;
    tree_pos[i] = 15;
    tree_child[i] = [];
    i = 16;
    tree_id[i] = UnknownEnum.Value_15;
    tree_parent[i] = 17;
    tree_pos[i] = 16;
    tree_child[i] = [];
    i = 17;
    tree_id[i] = UnknownEnum.Value_2;
    tree_parent[i] = 29;
    tree_pos[i] = 17;
    tree_child[i] = [16, 15];
    i = 18;
    tree_id[i] = UnknownEnum.Value_12;
    tree_parent[i] = 10;
    tree_pos[i] = 18;
    tree_child[i] = [];
    i = 19;
    tree_id[i] = UnknownEnum.Value_22;
    tree_parent[i] = 21;
    tree_pos[i] = 19;
    tree_child[i] = [];
    i = 20;
    tree_id[i] = UnknownEnum.Value_21;
    tree_parent[i] = 25;
    tree_pos[i] = 20;
    tree_child[i] = [];
    i = 21;
    tree_id[i] = UnknownEnum.Value_1;
    tree_parent[i] = 11;
    tree_pos[i] = 21;
    tree_child[i] = [25, 8, 19];
    i = 22;
    tree_id[i] = UnknownEnum.Value_20;
    tree_parent[i] = 8;
    tree_pos[i] = 22;
    tree_child[i] = [];
    i = 23;
    tree_id[i] = UnknownEnum.Value_11;
    tree_parent[i] = 7;
    tree_pos[i] = 23;
    tree_child[i] = [];
    i = 24;
    tree_id[i] = UnknownEnum.Value_10;
    tree_parent[i] = 11;
    tree_pos[i] = 24;
    tree_child[i] = [];
    i = 25;
    tree_id[i] = UnknownEnum.Value_2;
    tree_parent[i] = 21;
    tree_pos[i] = 25;
    tree_child[i] = [10, 20];
    i = 26;
    tree_id[i] = UnknownEnum.Value_9;
    tree_parent[i] = 28;
    tree_pos[i] = 26;
    tree_child[i] = [];
    i = 27;
    tree_id[i] = UnknownEnum.Value_8;
    tree_parent[i] = 28;
    tree_pos[i] = 27;
    tree_child[i] = [];
    i = 28;
    tree_id[i] = UnknownEnum.Value_1;
    tree_parent[i] = 29;
    tree_pos[i] = 28;
    tree_child[i] = [27, 26];
    i = 29;
    tree_id[i] = UnknownEnum.Value_1;
    tree_parent[i] = 12;
    tree_pos[i] = 29;
    tree_child[i] = [28, 9, 9, 17, 14];
    i = 30;
    tree_id[i] = UnknownEnum.Value_0;
    tree_parent[i] = -1;
    tree_pos[i] = 30;
    tree_child[i] = [12];
    var _size = array_length(tree_id);
    pos_roof = 0;
    
    for (i = 0; i < _size; i++)
    {
        if (tree_parent[i] == -1)
            pos_roof = i;
    }
    
    for (i = 0; i < _size; i++)
    {
        tree_node[i] = global.node_type[tree_id[i]];
        tree_node_child_now[i] = 0;
        tree_condition_checked[i] = 9999;
        tree_condition_checked_max[i] = global.node_check_condition_max[tree_id[i]];
        tree_condition_now[i] = false;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_4 = 4,
    Value_8 = 8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_15 = 15,
    Value_18 = 18,
    Value_20 = 20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25
}
