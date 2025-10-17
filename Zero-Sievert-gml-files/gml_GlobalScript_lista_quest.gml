function lista_quest()
{
    thank_for_help = "Thank you for your help";
    quest_completed = "Quest completed! Return to gain your reward!";
    global.list_quest_before_map_npc_name = ds_list_create();
    global.list_quest_before_map_quest_id = ds_list_create();
    global.list_quest_before_map_quest_premio = ds_list_create();
    var j = 0;
    rew_money[j] = 1500;
    rew_exp[j] = 35;
    rew_rep[j] = 3;
    j++;
    rew_money[j] = 2500;
    rew_exp[j] = 50;
    rew_rep[j] = 4;
    j++;
    rew_money[j] = 3500;
    rew_exp[j] = 65;
    rew_rep[j] = 5;
    j++;
    rew_money[j] = 4500;
    rew_exp[j] = 80;
    rew_rep[j] = 6;
    j++;
    rew_money[j] = 6000;
    rew_exp[j] = 100;
    rew_rep[j] = 7;
    var a = UnknownEnum.Value_1;
    var i = 0;
    global.q_reward_id[a][i] = "medikit_long";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "bandage";
    global.q_reward_qnt[a][i] = 3;
    i++;
    global.q_reward_id[a][i] = "bandage_sterilizzata";
    global.q_reward_qnt[a][i] = 2;
    i++;
    global.q_reward_id[a][i] = "pills_anti_rad";
    global.q_reward_qnt[a][i] = 2;
    i++;
    a = UnknownEnum.Value_2;
    i = 0;
    global.q_reward_id[a][i] = "medikit_long";
    global.q_reward_qnt[a][i] = 2;
    i++;
    global.q_reward_id[a][i] = "bandage_sterilizzata";
    global.q_reward_qnt[a][i] = 4;
    i++;
    global.q_reward_id[a][i] = "medikit_1";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "anti_bleed_gel";
    global.q_reward_qnt[a][i] = 2;
    i++;
    global.q_reward_id[a][i] = "med_wound_1";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "pills_anti_rad";
    global.q_reward_qnt[a][i] = 4;
    i++;
    a = UnknownEnum.Value_3;
    i = 0;
    global.q_reward_id[a][i] = "medikit_long";
    global.q_reward_qnt[a][i] = 3;
    i++;
    global.q_reward_id[a][i] = "medikit_1";
    global.q_reward_qnt[a][i] = 2;
    i++;
    global.q_reward_id[a][i] = "medikit_2";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "anti_bleed_gel";
    global.q_reward_qnt[a][i] = 3;
    i++;
    global.q_reward_id[a][i] = "med_wound_1";
    global.q_reward_qnt[a][i] = 2;
    i++;
    global.q_reward_id[a][i] = "med_wound_2";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "pills_anti_rad";
    global.q_reward_qnt[a][i] = 4;
    i++;
    a = UnknownEnum.Value_4;
    i = 0;
    global.q_reward_id[a][i] = "ammo_12x70";
    global.q_reward_qnt[a][i] = 20;
    i++;
    global.q_reward_id[a][i] = "ammo_9x18";
    global.q_reward_qnt[a][i] = 50;
    i++;
    global.q_reward_id[a][i] = "ammo_9x19";
    global.q_reward_qnt[a][i] = 50;
    i++;
    global.q_reward_id[a][i] = "ammo_762x25";
    global.q_reward_qnt[a][i] = 50;
    i++;
    global.q_reward_id[a][i] = "ammo_45";
    global.q_reward_qnt[a][i] = 40;
    i++;
    global.q_reward_id[a][i] = "ammo_57x28";
    global.q_reward_qnt[a][i] = 40;
    i++;
    global.q_reward_id[a][i] = "ammo_556x45_hp";
    global.q_reward_qnt[a][i] = 40;
    i++;
    global.q_reward_id[a][i] = "ammo_545x39_hp";
    global.q_reward_qnt[a][i] = 40;
    i++;
    global.q_reward_id[a][i] = "ammo_762x39_hp";
    global.q_reward_qnt[a][i] = 40;
    i++;
    global.q_reward_id[a][i] = "ammo_762x51_hp";
    global.q_reward_qnt[a][i] = 20;
    i++;
    global.q_reward_id[a][i] = "ammo_9x39";
    global.q_reward_qnt[a][i] = 30;
    i++;
    global.q_reward_id[a][i] = "ammo_762x54R";
    global.q_reward_qnt[a][i] = 15;
    i++;
    a = UnknownEnum.Value_5;
    i = 0;
    global.q_reward_id[a][i] = "ammo_12x70";
    global.q_reward_qnt[a][i] = 20;
    i++;
    global.q_reward_id[a][i] = "ammo_12x70_slug";
    global.q_reward_qnt[a][i] = 15;
    i++;
    global.q_reward_id[a][i] = "ammo_9x18";
    global.q_reward_qnt[a][i] = 70;
    i++;
    global.q_reward_id[a][i] = "ammo_9x18_pbm";
    global.q_reward_qnt[a][i] = 30;
    i++;
    global.q_reward_id[a][i] = "ammo_9x19";
    global.q_reward_qnt[a][i] = 70;
    i++;
    global.q_reward_id[a][i] = "ammo_9x19_ap";
    global.q_reward_qnt[a][i] = 30;
    i++;
    global.q_reward_id[a][i] = "ammo_762x25";
    global.q_reward_qnt[a][i] = 70;
    i++;
    global.q_reward_id[a][i] = "ammo_762x25_pst";
    global.q_reward_qnt[a][i] = 40;
    i++;
    global.q_reward_id[a][i] = "ammo_45";
    global.q_reward_qnt[a][i] = 50;
    i++;
    global.q_reward_id[a][i] = "ammo_45_ap";
    global.q_reward_qnt[a][i] = 20;
    i++;
    global.q_reward_id[a][i] = "ammo_57x28";
    global.q_reward_qnt[a][i] = 50;
    i++;
    global.q_reward_id[a][i] = "ammo_57x28_ss190";
    global.q_reward_qnt[a][i] = 20;
    i++;
    global.q_reward_id[a][i] = "ammo_556x45_hp";
    global.q_reward_qnt[a][i] = 60;
    i++;
    global.q_reward_id[a][i] = "ammo_556x45";
    global.q_reward_qnt[a][i] = 30;
    i++;
    global.q_reward_id[a][i] = "ammo_545x39_hp";
    global.q_reward_qnt[a][i] = 60;
    i++;
    global.q_reward_id[a][i] = "ammo_545x39";
    global.q_reward_qnt[a][i] = 30;
    i++;
    global.q_reward_id[a][i] = "ammo_762x39_hp";
    global.q_reward_qnt[a][i] = 50;
    i++;
    global.q_reward_id[a][i] = "ammo_762x39";
    global.q_reward_qnt[a][i] = 30;
    i++;
    global.q_reward_id[a][i] = "ammo_762x51_hp";
    global.q_reward_qnt[a][i] = 30;
    i++;
    global.q_reward_id[a][i] = "ammo_762x51";
    global.q_reward_qnt[a][i] = 15;
    i++;
    global.q_reward_id[a][i] = "ammo_9x39";
    global.q_reward_qnt[a][i] = 40;
    i++;
    global.q_reward_id[a][i] = "ammo_762x54R";
    global.q_reward_qnt[a][i] = 20;
    i++;
    a = UnknownEnum.Value_6;
    i = 0;
    global.q_reward_id[a][i] = "ammo_12x70";
    global.q_reward_qnt[a][i] = 30;
    i++;
    global.q_reward_id[a][i] = "ammo_12x70_slug";
    global.q_reward_qnt[a][i] = 20;
    i++;
    global.q_reward_id[a][i] = "ammo_12x70_slug_ap";
    global.q_reward_qnt[a][i] = 15;
    i++;
    global.q_reward_id[a][i] = "ammo_9x18";
    global.q_reward_qnt[a][i] = 80;
    i++;
    global.q_reward_id[a][i] = "ammo_9x18_pbm";
    global.q_reward_qnt[a][i] = 50;
    i++;
    global.q_reward_id[a][i] = "ammo_9x19";
    global.q_reward_qnt[a][i] = 80;
    i++;
    global.q_reward_id[a][i] = "ammo_9x19_ap";
    global.q_reward_qnt[a][i] = 40;
    i++;
    global.q_reward_id[a][i] = "ammo_762x25";
    global.q_reward_qnt[a][i] = 80;
    i++;
    global.q_reward_id[a][i] = "ammo_762x25_pst";
    global.q_reward_qnt[a][i] = 50;
    i++;
    global.q_reward_id[a][i] = "ammo_45";
    global.q_reward_qnt[a][i] = 70;
    i++;
    global.q_reward_id[a][i] = "ammo_45_ap";
    global.q_reward_qnt[a][i] = 40;
    i++;
    global.q_reward_id[a][i] = "ammo_57x28";
    global.q_reward_qnt[a][i] = 70;
    i++;
    global.q_reward_id[a][i] = "ammo_57x28_ss190";
    global.q_reward_qnt[a][i] = 40;
    i++;
    global.q_reward_id[a][i] = "ammo_556x45_hp";
    global.q_reward_qnt[a][i] = 80;
    i++;
    global.q_reward_id[a][i] = "ammo_556x45";
    global.q_reward_qnt[a][i] = 50;
    i++;
    global.q_reward_id[a][i] = "ammo_556x45_m995";
    global.q_reward_qnt[a][i] = 25;
    i++;
    global.q_reward_id[a][i] = "ammo_545x39_hp";
    global.q_reward_qnt[a][i] = 80;
    i++;
    global.q_reward_id[a][i] = "ammo_545x39";
    global.q_reward_qnt[a][i] = 50;
    i++;
    global.q_reward_id[a][i] = "ammo_545x39_bt";
    global.q_reward_qnt[a][i] = 40;
    i++;
    global.q_reward_id[a][i] = "ammo_762x39_hp";
    global.q_reward_qnt[a][i] = 80;
    i++;
    global.q_reward_id[a][i] = "ammo_762x39";
    global.q_reward_qnt[a][i] = 40;
    i++;
    global.q_reward_id[a][i] = "ammo_762x39_bp";
    global.q_reward_qnt[a][i] = 20;
    i++;
    global.q_reward_id[a][i] = "ammo_762x51_hp";
    global.q_reward_qnt[a][i] = 40;
    i++;
    global.q_reward_id[a][i] = "ammo_762x51";
    global.q_reward_qnt[a][i] = 25;
    i++;
    global.q_reward_id[a][i] = "ammo_762x51_m61";
    global.q_reward_qnt[a][i] = 10;
    i++;
    global.q_reward_id[a][i] = "ammo_9x39";
    global.q_reward_qnt[a][i] = 50;
    i++;
    global.q_reward_id[a][i] = "ammo_9x39_bp";
    global.q_reward_qnt[a][i] = 30;
    i++;
    global.q_reward_id[a][i] = "ammo_762x54R";
    global.q_reward_qnt[a][i] = 25;
    i++;
    global.q_reward_id[a][i] = "ammo_762x54R_snb";
    global.q_reward_qnt[a][i] = 10;
    i++;
    a = UnknownEnum.Value_7;
    i = 0;
    global.q_reward_id[a][i] = "canned_beans";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "crackers";
    global.q_reward_qnt[a][i] = 2;
    i++;
    global.q_reward_id[a][i] = "water_bottle";
    global.q_reward_qnt[a][i] = 2;
    i++;
    global.q_reward_id[a][i] = "vodka";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "meat_cooked";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "raw_meat";
    global.q_reward_qnt[a][i] = 2;
    a = UnknownEnum.Value_8;
    i = 0;
    global.q_reward_id[a][i] = "mre";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "generic_chocolate";
    global.q_reward_qnt[a][i] = 2;
    i++;
    global.q_reward_id[a][i] = "pasta";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "coke";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_23;
    i = 0;
    global.q_reward_id[a][i] = "repair_armor_high";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "repair_weapon1_high";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "repair_weapon2_high";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "repair_weapon3_high";
    global.q_reward_qnt[a][i] = 1;
    a = UnknownEnum.Value_24;
    i = 0;
    global.q_reward_id[a][i] = "repair_armor_low";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "repair_weapon1_low";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "repair_weapon2_low";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "repair_weapon3_low";
    global.q_reward_qnt[a][i] = 1;
    a = UnknownEnum.Value_25;
    i = 0;
    global.q_reward_id[a][i] = "repair_armor_high";
    global.q_reward_qnt[a][i] = 3;
    i++;
    global.q_reward_id[a][i] = "repair_weapon1_high";
    global.q_reward_qnt[a][i] = 3;
    i++;
    global.q_reward_id[a][i] = "repair_weapon2_high";
    global.q_reward_qnt[a][i] = 3;
    i++;
    global.q_reward_id[a][i] = "repair_weapon3_high";
    global.q_reward_qnt[a][i] = 3;
    a = UnknownEnum.Value_31;
    i = 0;
    global.q_reward_id[a][i] = "repair_armor_low";
    global.q_reward_qnt[a][i] = 2;
    i++;
    global.q_reward_id[a][i] = "repair_weapon1_low";
    global.q_reward_qnt[a][i] = 2;
    i++;
    global.q_reward_id[a][i] = "repair_weapon2_low";
    global.q_reward_qnt[a][i] = 2;
    i++;
    global.q_reward_id[a][i] = "repair_weapon3_low";
    global.q_reward_qnt[a][i] = 1;
    a = UnknownEnum.Value_9;
    i = 0;
    global.q_reward_id[a][i] = "ak_74";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "sks";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "toz34";
    global.q_reward_qnt[a][i] = 1;
    a = UnknownEnum.Value_11;
    i = 0;
    global.q_reward_id[a][i] = "sawed_off_double_shotgun";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "aps";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "skorpion";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "ak_74u_1";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "sks";
    global.q_reward_qnt[a][i] = 1;
    a = UnknownEnum.Value_12;
    i = 0;
    global.q_reward_id[a][i] = "ak_74";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "toz34";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mosin";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "pp91";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "ppsh_41_1";
    global.q_reward_qnt[a][i] = 1;
    a = UnknownEnum.Value_13;
    i = 0;
    global.q_reward_id[a][i] = "akm";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "tapco";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "p90";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "sv98_1";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_14;
    i = 0;
    global.q_reward_id[a][i] = "m4a1";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "as_val";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "r700_modern";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "svd";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_15;
    i = 0;
    global.q_reward_id[a][i] = "mp153";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_21;
    i = 0;
    global.q_reward_id[a][i] = "base_storage_use";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_10;
    i = 0;
    global.q_reward_id[a][i] = "book_medicine";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "book_gunsmith";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "book_cooking";
    global.q_reward_qnt[a][i] = 1;
    a = UnknownEnum.Value_16;
    i = 0;
    global.q_reward_id[a][i] = "medikit_long";
    global.q_reward_qnt[a][i] = 5;
    i++;
    global.q_reward_id[a][i] = "med_wound_2";
    global.q_reward_qnt[a][i] = 2;
    i++;
    global.q_reward_id[a][i] = "ammo_12x70";
    global.q_reward_qnt[a][i] = 40;
    i++;
    global.q_reward_id[a][i] = "ammo_545x39";
    global.q_reward_qnt[a][i] = 150;
    i++;
    global.q_reward_id[a][i] = "ammo_762x39";
    global.q_reward_qnt[a][i] = 120;
    i++;
    global.q_reward_id[a][i] = "ammo_9x18";
    global.q_reward_qnt[a][i] = 200;
    i++;
    global.q_reward_id[a][i] = "ammo_762x25";
    global.q_reward_qnt[a][i] = 150;
    i++;
    global.q_reward_id[a][i] = "ammo_57x28";
    global.q_reward_qnt[a][i] = 150;
    a = UnknownEnum.Value_17;
    i = 0;
    global.q_reward_id[a][i] = "toz34";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "repair_weapon1_high";
    global.q_reward_qnt[a][i] = 3;
    i++;
    global.q_reward_id[a][i] = "repair_weapon2_high";
    global.q_reward_qnt[a][i] = 3;
    i++;
    global.q_reward_id[a][i] = "repair_weapon3_high";
    global.q_reward_qnt[a][i] = 2;
    i++;
    global.q_reward_id[a][i] = "repair_armor_high";
    global.q_reward_qnt[a][i] = 3;
    a = UnknownEnum.Value_18;
    i = 0;
    global.q_reward_id[a][i] = "mod_ak74_stock_2";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_ak74_handguard_2_b";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_sks_magazine_20";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_pp91_handguard";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_ak74u_handguard_1";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_mp5_handguard_2";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_mp5_magazine_2";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_scope_kobra";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_foregrip_2";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_laser_verde";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_torch_1";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_scope_pso";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_scope_pu";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_19;
    i = 0;
    global.q_reward_id[a][i] = "mod_silencer_762x54";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_silencer_545x39";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_silencer_762x39";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_ar15_silencer_2";
    global.q_reward_qnt[a][i] = 1;
    a = UnknownEnum.Value_20;
    i = 0;
    global.q_reward_id[a][i] = "mod_scope_elcan";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_scope_leupold";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_scope_holosun";
    global.q_reward_qnt[a][i] = 1;
    a = UnknownEnum.Value_22;
    i = 0;
    global.q_reward_id[a][i] = "mod_ak74_stock_3";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_ak74u_handguard_1";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_ak74_handguard_2_b";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_sks_handguard_1";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_mp153_handguard_1";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_silencer_9x18";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_silencer_57x28";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "mod_sks_magazine_20";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_26;
    i = 0;
    global.q_reward_id[a][i] = "armor_scientist_1";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "armor_police";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_27;
    i = 0;
    global.q_reward_id[a][i] = "armor_police";
    global.q_reward_qnt[a][i] = 1;
    i++;
    global.q_reward_id[a][i] = "armor_novice";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_28;
    i = 0;
    global.q_reward_id[a][i] = "armor_faction1_0";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_29;
    i = 0;
    global.q_reward_id[a][i] = "armor_loner_2";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_30;
    i = 0;
    global.q_reward_id[a][i] = "armor_scientist_3";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_32;
    i = 0;
    global.q_reward_id[a][i] = "armor_m_2";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_33;
    i = 0;
    global.q_reward_id[a][i] = "headset_lamp1";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_34;
    i = 0;
    global.q_reward_id[a][i] = "headset_lamp2";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_35;
    i = 0;
    global.q_reward_id[a][i] = "headset_nv_1";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_36;
    i = 0;
    global.q_reward_id[a][i] = "headset_nv_2";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_37;
    i = 0;
    global.q_reward_id[a][i] = "headset_nv_3";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_38;
    i = 0;
    global.q_reward_id[a][i] = "armor_killa";
    global.q_reward_qnt[a][i] = 1;
    i++;
    a = UnknownEnum.Value_29;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (3)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_4);
    
    repeat (3)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_1);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_7);
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_23);
    
    a = UnknownEnum.Value_30;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (3)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_5);
    
    repeat (3)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_2);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_7);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_23);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_18);
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_24);
    
    a = UnknownEnum.Value_31;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (4)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_5);
    
    repeat (4)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_2);
    
    repeat (3)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_8);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_22);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_24);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_6);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_3);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_35);
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_10);
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_20);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_11);
    
    a = UnknownEnum.Value_32;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_8);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_22);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_24);
    
    repeat (4)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_6);
    
    repeat (3)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_3);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_36);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_12);
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_19);
    
    a = UnknownEnum.Value_0;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (4)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_4);
    
    repeat (4)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_1);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_7);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_23);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_18);
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_5);
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_2);
    
    a = UnknownEnum.Value_1;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (4)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_5);
    
    repeat (4)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_2);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_8);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_23);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_18);
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_6);
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_3);
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_24);
    
    a = UnknownEnum.Value_2;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (4)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_6);
    
    repeat (4)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_3);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_8);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_23);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_18);
    
    repeat (2)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_24);
    
    a = UnknownEnum.Value_4;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_10);
    
    a = UnknownEnum.Value_5;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_11);
    
    a = UnknownEnum.Value_6;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_12);
    
    a = UnknownEnum.Value_7;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_13);
    
    a = UnknownEnum.Value_8;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_14);
    
    a = UnknownEnum.Value_19;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_21);
    
    a = UnknownEnum.Value_10;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_16);
    
    a = UnknownEnum.Value_13;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_17);
    
    a = UnknownEnum.Value_3;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_22);
    
    a = UnknownEnum.Value_9;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_15);
    
    a = UnknownEnum.Value_14;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_26);
    
    a = UnknownEnum.Value_15;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_27);
    
    a = UnknownEnum.Value_16;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_28);
    
    a = UnknownEnum.Value_17;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_29);
    
    a = UnknownEnum.Value_18;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_30);
    
    a = UnknownEnum.Value_12;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_31);
    
    a = UnknownEnum.Value_11;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_25);
    
    a = UnknownEnum.Value_21;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_20);
    
    a = UnknownEnum.Value_22;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_32);
    
    a = UnknownEnum.Value_23;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_33);
    
    a = UnknownEnum.Value_24;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_34);
    
    a = UnknownEnum.Value_25;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_35);
    
    a = UnknownEnum.Value_26;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_36);
    
    a = UnknownEnum.Value_27;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_37);
    
    a = UnknownEnum.Value_28;
    global.list_reward_quest[a] = ds_list_create();
    
    repeat (1)
        ds_list_add(global.list_reward_quest[a], UnknownEnum.Value_38);
    
    for (i = 0; i < UnknownEnum.Value_177; i++)
    {
        for (j = 0; j < 7; j++)
        {
            global.quest_marker[i][j] = false;
            global.quest_marker_sub[i][j] = -1;
            global.quest_text_obj[i][j] = "";
            global.quest_is_daily[i] = false;
            global.quest_daily_reward[i] = 0;
            global.quest_is_removable[i] = false;
        }
    }
    
    a = UnknownEnum.Value_1;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Kill Lazar";
    global.quest_type[a] = "kill";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_obj_to_kill[a][0] = obj_enemy_human_bandit_boss;
    global.quest_stage_completed[a] = 2;
    global.quest_amount_now[a] = 0;
    global.quest_amount_max[a] = 1;
    global.quest_reward[a] = 6500;
    global.quest_exp[a] = 50;
    global.quest_liv_min[a] = 1;
    global.quest_rep[a] = rew_rep[1];
    global.quest_reward_arr[a] = UnknownEnum.Value_14;
    global.quest_text[a][0] = "Are you ready for some real action? You have to kill Lazar, the leader of the forest bandits.\nHe is located in the police station of the village, maybe you have already met him during one of your hunts.\nPrepare yourself well, he is always surrounded by his guards.\nIt won't be easy to kill him, but afterwards you'll be able to freely enter the police station and take what you want.";
    global.quest_text[a][1] = "Kill Lazar";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    global.quest_kill_map[a] = -1;
    a = UnknownEnum.Value_2;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "First steps p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_4;
    global.quest_text[a][0] = "Hey stranger! Welcome to the ZERO Sievert bunker.\nI don't know how you got here and frankly I don't care.\nIt's nothing personal, it's just that we see a lot of new faces here and only a few of them come back, so I won't waste my time remembering yours for now.\nFirst let's see what you can do, I'll give you a simple job: go to the forest and survive.\nGood luck!";
    global.quest_text[a][1] = "Kill 5 bandits in the forest";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_survive_map(a, 0, 1, UnknownEnum.Value_1);
    a = UnknownEnum.Value_3;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "First steps p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_5;
    global.quest_text[a][0] = "Are you still alive? Fantastic!\nLooks like you have potential but it's still too early to tell, let's see how you do in combat.\nIf you survive I'll alert the Green Army that a new Hunter has arrived. I'll make sure you can get into their bunker area.";
    global.quest_text[a][1] = "Survive the forest 2 times";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_kill(a, 0, 5, "Bandits", UnknownEnum.Value_1, ["bandit_boss", "bandit_boss_guard", "bandit_novice", "bandit_regular"]);
    scr_quest_create_kill(a, 1, 5, -1, UnknownEnum.Value_1, ["wolf_brown"]);
    a = UnknownEnum.Value_4;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Valuable item";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_11;
    global.quest_text[a][0] = "Very good! The Green Army grants you access to their bunker area. You should go and talk to them, they can sell you new equipment and give you some work to do.\nOkay, back to us! So... When the bandits took over the village in the forest, an old friend of mine left behind an item that is considered very valuable these days.\nThe item should be inside a bag in the southern part of the village, go there and retrieve it.";
    global.quest_text[a][1] = "Retrieve the valuable item";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 1, "toilet_paper_quest");
    global.quest_text_obj[a][0] = "Retrieve the valuable item";
    a = UnknownEnum.Value_5;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Smoking kills p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_10;
    global.quest_text[a][0] = "Yeah, I know. Smoking kills, but I don't know how long we're going to survive here anyway, so you might as well indulge a bit, right?\nI need a lot of cigarettes to build up a stock. \nIf you find any blue ones don't sell them, just keep them. I'll need them later on.";
    global.quest_text[a][1] = "Find 10 red cigarette";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 8, "red_cigarettes");
    scr_quest_create_collect(a, 1, 10, "matches");
    scr_quest_create_collect(a, 2, 3, "lighter");
    scr_quest_create_collect(a, 3, 2, "zippo");
    a = UnknownEnum.Value_6;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Smoking kills p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[4];
    global.quest_exp[a] = rew_exp[4];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_4;
    global.quest_text[a][0] = "Ok hunter, now if by chance you could also bring me some blue ones it would be great!.\nThey are of a much higher quality.";
    global.quest_text[a][1] = "Find 5 blue cigarette";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 8, "blue_cigarettes");
    scr_quest_create_collect(a, 1, 1, "zippo_gold");
    a = UnknownEnum.Value_7;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "The lost convoy";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_0;
    global.quest_text[a][0] = "We lost contact with a convoy carrying supplies for the bunker.\nWhen the transmission stopped it was in the forest, go there and find out what happened.";
    global.quest_text[a][1] = "Find 5 blue cigarette";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_approach(a, 0, obj_quest_approach_lost_convoy, 80, UnknownEnum.Value_1);
    global.quest_marker[a][0] = true;
    global.quest_marker_sub[a][0] = 13;
    global.quest_text_obj[a][0] = "Find the lost convoy";
    a = UnknownEnum.Value_8;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Vendetta";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[3];
    global.quest_exp[a] = rew_exp[2];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_5;
    global.quest_text[a][0] = "Damn it! Was it the bandits then? I'm not surprised, they are always causing a trouble.\nIt's time for revenge, kill as many bandits as you can, Hunter.";
    global.quest_text[a][1] = "Survive the forest 2 times";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_kill(a, 0, 20, "Bandits", -1, ["bandit_boss", "bandit_boss_guard", "bandit_novice", "bandit_regular"]);
    a = UnknownEnum.Value_9;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Survivalist: Forest p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[2];
    global.quest_exp[a] = rew_exp[2];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "I see that you are becoming familiar with the hunts.\nLet's see what you are capable of, I am ready to pay you well if you can survive in these conditions.\nGood luck!";
    global.quest_text[a][1] = "Survive the forest 2 times";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_survive_min_exp(a, 0, 1, UnknownEnum.Value_1, 200);
    scr_quest_create_survive_min_roubles(a, 1, 1, UnknownEnum.Value_1, 8000);
    a = UnknownEnum.Value_10;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Survivalist: Forest p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[2];
    global.quest_exp[a] = rew_exp[4];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_19;
    global.quest_text[a][0] = "Not bad Hunter, let's see if you can now beat my record in the forest";
    global.quest_text[a][1] = "Survive the forest 2 times";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_survive_min_exp(a, 0, 1, UnknownEnum.Value_1, 350);
    scr_quest_create_survive_min_roubles(a, 1, 1, UnknownEnum.Value_1, 15000);
    a = UnknownEnum.Value_11;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Supply p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[1];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_0;
    global.quest_text[a][0] = "Hey Hunter!\nRecently, few supplies have arrived and people still need to eat.\nWe could use some help replenishing our supplies.";
    global.quest_text[a][1] = "Find 10 bread";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 5, "bread");
    scr_quest_create_collect(a, 1, 5, "water_bottle");
    scr_quest_create_collect(a, 2, 1, "mre");
    a = UnknownEnum.Value_12;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Supply p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[2];
    global.quest_exp[a] = rew_exp[2];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "Great!\nNow that we're settled on the essentials, I'd like you to bring me some more lasting food, like canned food.";
    global.quest_text[a][1] = "Find 3 generic chocolate";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 8, "tushonka_meat");
    scr_quest_create_collect(a, 1, 8, "tushonka_fish");
    scr_quest_create_collect(a, 2, 3, "pasta");
    a = UnknownEnum.Value_13;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Chocolate for everyone";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[4];
    global.quest_exp[a] = rew_exp[2];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "Chocolate is becoming a luxury good now, bring me some. I will pay you well";
    global.quest_text[a][1] = "Find 3 generic chocolate";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 8, "generic_chocolate");
    scr_quest_create_collect(a, 1, 4, "russian_chocolate");
    a = UnknownEnum.Value_15;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "No more barks";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[2];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_0;
    global.quest_text[a][0] = "Have you heard the latest news? A group of Hunters have been attacked by a pack of wolves, their numbers have increased a lot lately and this is causing us problems in moving around the area.\nSomeone's got to do the dirty work.\nIf you want the job, it's yours.";
    global.quest_text[a][1] = "Kill 15 wolfs";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_kill(a, 0, 15, -1, UnknownEnum.Value_1, ["wolf_brown"]);
    a = UnknownEnum.Value_17;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Cutlery";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[0];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "Hey Hunter!\nI have a very simple but boring job to do. \nThese animals that live here keep stealing my cutlery once they finish eating, assholes. I'd like to see them run a bar in this place without going crazy.\nAnyway, I need forks, knives and spoons.\nBring them to me.";
    global.quest_text[a][1] = "Find 8 forks";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 8, "fork");
    scr_quest_create_collect(a, 1, 8, "spoon");
    scr_quest_create_collect(a, 2, 8, "knife");
    a = UnknownEnum.Value_14;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "What's on the flash drive?";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[0];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "Hunter! Last night I had the strangest dream!\nI don't know for what reason but I had to find two flash drives and take them to a strange guy with a beanie. The crazy thing was that I couldn't find these flash drives anywhere, ANYWHERE!\nCan you imagine what that feels like? To have to find two flash drives but not be able to do it?\nWell, you'll figure it out for yourself. Find two and bring them to me";
    global.quest_text[a][1] = "Find 8 forks";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 2, "usb");
    a = UnknownEnum.Value_18;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "What's cooking?";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[2];
    global.quest_exp[a] = rew_exp[2];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "Are you up for a simple job? I need a few things for my kitchen.";
    global.quest_text[a][1] = "Find 2 cooking pots";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 4, "pot_cooking");
    scr_quest_create_collect(a, 1, 30, "salt");
    scr_quest_create_collect(a, 2, 30, "pepper");
    a = UnknownEnum.Value_16;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "New arrivals";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[2];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_15;
    global.quest_text[a][0] = "Very interesting. From the flash drives you brought me I found out that there is a lot of movement in the port area of the industrial zone, go there and find out what it is all about.";
    global.quest_text[a][1] = "Find 2 cooking pots";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_approach(a, 0, obj_quest_approach_new_arrivals, 96, UnknownEnum.Value_3);
    global.quest_text_obj[a][0] = "Investigate the port area of the industrial map";
    a = UnknownEnum.Value_19;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "The lost backpack";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[2];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "We lost contact with two hunters. It appears they were attacked in the forest.\nFrom the latest transmissions it seems that one stayed in the forest and the other escaped towards the makeshift camp.\nIn any case I doubt they are still alive, search for their bodies and bring me their equipment before the bandits arrive.";
    global.quest_text[a][1] = "Find 2 cooking pots";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_retrieve(a, 0, "quest_retrive_backpack_forest", obj_chest_retrive_forest, UnknownEnum.Value_1);
    global.quest_marker[a][0] = true;
    global.quest_marker_sub[a][0] = 12;
    global.quest_text_obj[a][0] = "Retrieve the equipment in the forest";
    scr_quest_create_retrieve(a, 1, "quest_retrive_backpack_makeshift_camp", obj_chest_retrive_makeshift_camp, UnknownEnum.Value_2);
    global.quest_marker[a][1] = true;
    global.quest_marker_sub[a][1] = 12;
    global.quest_text_obj[a][1] = "Retrieve the equipment in the makeshift camp";
    a = UnknownEnum.Value_20;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Survivalist: Makeshift camp p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_6;
    global.quest_text[a][0] = "Ready to test your limits again? Are you up for it?";
    global.quest_text[a][1] = "Survive the forest 2 times";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_survive_min_exp(a, 0, 1, UnknownEnum.Value_2, 250);
    scr_quest_create_survive_min_roubles(a, 1, 1, UnknownEnum.Value_2, 8000);
    a = UnknownEnum.Value_21;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Survivalist: Makeshift camp p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_3;
    global.quest_text[a][0] = "I don't think you can make it this time.";
    global.quest_text[a][1] = "Survive the forest 2 times";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_survive_min_exp(a, 0, 1, UnknownEnum.Value_2, 400);
    scr_quest_create_survive_min_roubles(a, 1, 1, UnknownEnum.Value_2, 16000);
    a = UnknownEnum.Value_89;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Documents p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[1];
    global.quest_exp[a] = rew_exp[2];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "One of our hunters and my personal friend was on a special mission, trying to find the location of valuable documents.\nWe lost his contact when he entered the makeshift camp, fortunately we still have his last detected position.\nGo to the makeshift camp and find out what happened to him.\nI hope he is still alive...";
    global.quest_text[a][1] = "Find the missing Hunter";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_approach(a, 0, obj_quest_approach_documents_1, 16, UnknownEnum.Value_2);
    global.quest_marker[a][0] = true;
    global.quest_marker_sub[a][0] = 0;
    global.quest_text_obj[a][0] = "Find the missing Hunter";
    a = UnknownEnum.Value_90;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Documents p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[2];
    global.quest_exp[a] = rew_exp[3];
    global.quest_rep[a] = rew_rep[2];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_4;
    global.quest_text[a][0] = "So he's dead... May he rest in peace.\nThe good news is that he found the location of the documents, from his notes it seems they are in the police station in the forest village.\nThe bad news is that you'll have to fight your way in, as you know there are much more organised bandits stationed there.\nThe documents should be inside a safe, when you're inside the station try looking around.\nGood luck Hunter!";
    global.quest_text[a][1] = "Retrieve the documents";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 1, "quest_document_2");
    global.quest_text_obj[a][0] = "Retrieve the documents";
    a = UnknownEnum.Value_24;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Makeshift camp";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_4;
    global.quest_text[a][0] = "We detected movement in the makeshift camp by bandits, do some hunting and get rid of them.";
    global.quest_text[a][1] = "Kill 5 bandits in the forest";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_survive_map(a, 0, 3, UnknownEnum.Value_2);
    scr_quest_create_kill(a, 1, 15, "Bandits", UnknownEnum.Value_2, ["bandit_boss", "bandit_boss_guard", "bandit_novice", "bandit_regular"]);
    a = UnknownEnum.Value_25;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "The missing group p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[1];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "Hey Hunter!\nI finished analyzing the documents. There are many drawings of a strange purple crystal, from the directions it seems to be in the swamp.\nThe documents don't seem to contain any trace of scientific data and I don't know what it could be, I sent a team to the swamp to check it out but I lost their contact.\nWe know their last location but I have a bad feeling. When you lose contact with someone out there you already know what happened....\nGo to the swamp and head for their last known position, maybe you can find out more.";
    global.quest_text[a][1] = "Find the missing group";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_approach(a, 0, obj_quest_approach_missing_group_1, 16, UnknownEnum.Value_4);
    global.quest_marker[a][0] = true;
    global.quest_marker_sub[a][0] = 11;
    global.quest_text_obj[a][0] = "Find the missing group";
    a = UnknownEnum.Value_26;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "The missing group p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[3];
    global.quest_exp[a] = rew_exp[4];
    global.quest_rep[a] = rew_rep[1];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_8;
    global.quest_text[a][0] = "Damn it!\nA few reports have come in from scouts saying they've seen an incredible beast, or rather, they said they've seen their companion torn to pieces by this beast.\nThe group seems to have come into contact with it.\nMost likely it will still be in the swamp, I am not asking you to take this huge risk but if you do, the pay will be very high.\nGood luck Hunter!";
    global.quest_text[a][1] = "Kill the monster";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_contract(a, 0, obj_enemy_big, UnknownEnum.Value_4, "Unknown");
    a = UnknownEnum.Value_27;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Stylish one";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = 10000;
    global.quest_exp[a] = 250;
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_28;
    global.quest_text[a][0] = "Have you been to the mall yet? In any case, you must know about the guy who hangs around inside, a very tough guy.\nAnyway, his armour is of incredible quality. If you kill him a few times, I'll give you one.";
    global.quest_text[a][1] = "Survive the forest 2 times";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_kill(a, 0, 15, -1, UnknownEnum.Value_6, ["killa"]);
    a = UnknownEnum.Value_28;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Secret documents";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[0];
    global.quest_rep[a] = rew_rep[1];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_23;
    global.quest_text[a][0] = "Hey! The bartender told me about you. Sounds like you have potential. Well, let's see what you're capable of.\nA while ago, bandits occupied the village in the middle of the forest, it seems they are more organised and stronger than the usual bandits so you'll have to be careful.\nWhat I want you to do is retrieve some documents from a corpse in the village, it should be in the north area, outside a house.\nWe don't know the exact location so I can't put it on the map, you'll have to look for it yourself.\nGood luck!";
    global.quest_text[a][1] = "Retrieve documents located in the village";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 1, "quest_retrieve_document_village");
    global.quest_text_obj[a][0] = "Retrieve the documents";
    a = UnknownEnum.Value_29;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "The old man";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_is_removable[a] = true;
    global.quest_reward[a] = 15000;
    global.quest_exp[a] = rew_exp[4];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_19;
    global.quest_text[a][0] = "This is more of a personal favour than a real job.\nAfter the explosion at the nuclear power plant, we were instructed to evacuate all the surrounding areas.\nWhen we arrived at the forest my men came across an old man, I think his name was Igor.\nThe fact is that the old man did not want to leave his home and threatened my men, he was very angry. \nWe have a few men stationed in the forest and I would not want Igor to interfere with our operations, so I ask you to take care of him, it should not be a problem, he is old and weak now.";
    global.quest_text[a][1] = "Kill Igor";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_contract(a, 0, obj_forest_trader, UnknownEnum.Value_1, "Igor Kuzmin");
    global.quest_text_obj[a][0] = "Eliminate Igor";
    a = UnknownEnum.Value_30;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Sawmill p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[0];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_0;
    global.quest_text[a][0] = "Since you were successful with the last mission, I want to offer you a similar job.\nThis time the destination is the sawmill in the forest. Unfortunately we don't know the exact location but you should be able to find it by looking at the map, it should be a grey rectangle.\nThere's no need to fight, you just need to do a survey. Just approach the sawmill to complete the mission.";
    global.quest_text[a][1] = "Approach the sawmill";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_approach(a, 0, obj_quest_approach_sawmill_1, 460, UnknownEnum.Value_1);
    global.quest_text_obj[a][0] = "Find the sawmill";
    a = UnknownEnum.Value_31;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Sawmill p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = 3500;
    global.quest_exp[a] = 110;
    global.quest_rep[a] = rew_rep[1];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_5;
    global.quest_text[a][0] = "Ok looks like the sawmill is currently occupied by the bandits. I'll explain what you have to do.\nInside there is a safe with a USB stick, it should contain valuable information for the Green Army, all you have to do is retrieve it.\nObviously this involves killing some bandits. Be careful Hunter, you might find a lot of them.";
    global.quest_text[a][1] = "Find the USB drive in the sawmill";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 1, "quest_find_usb_sawmill");
    a = UnknownEnum.Value_34;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Ghoul destroyer p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_11;
    global.quest_text[a][0] = "Hey Hunter!\nAre you up for a simple quest? You have to eliminate a few ghouls, nothing easier.";
    global.quest_text[a][1] = "Kill 40 Ghouls";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_kill(a, 0, 12, -1, -1, ["ghoul"]);
    a = UnknownEnum.Value_35;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Ghoul destroyer p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[3];
    global.quest_exp[a] = rew_exp[4];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_9;
    global.quest_text[a][0] = "If you liked the last work you will also like this one.\nThere is always a need to eliminate threats in the area.\nIt's an optional job but the rewards will be high.";
    global.quest_text[a][1] = "Kill 40 Ghouls";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_kill(a, 0, 40, -1, -1, ["ghoul"]);
    a = UnknownEnum.Value_32;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Equipment p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "Hey Hunter! We are preparing for an important mission and need all the equipment we can get.\nI want you to bring me some scrap ammo and scrap weapon so that my men can get ready.";
    global.quest_text[a][1] = "Find 250 scrap ammo";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 250, "scrap_ammo");
    scr_quest_create_collect(a, 1, 180, "scrap_weapon");
    a = UnknownEnum.Value_33;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Equipment p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[3];
    global.quest_exp[a] = rew_exp[2];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_4;
    global.quest_text[a][0] = "You seem to be almost as good at retrieving objects as a dog.\nIf you find good quality ammunition, don't sell it, bring it to me.";
    global.quest_text[a][1] = "Find 250 scrap ammo";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 45, "ammo_545x39_bt");
    scr_quest_create_collect(a, 1, 20, "ammo_762x54R_snb");
    scr_quest_create_collect(a, 2, 30, "ammo_9x39");
    a = UnknownEnum.Value_36;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "The Lair";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[0];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "We believe that there is a Ghoul's lair hidden somewhere in the forest, unfortunately we have no idea where it is so I sent explorers into the forest to find it.\nThe more people who look for it, the sooner we can find it, right?\nSo I'm asking you to go into the forest and look for it, you'll have to explore the area to find it.\nWhen you find it, approach the entrance to inspect it and then come back to report.";
    global.quest_text[a][1] = "Find the Ghoul's lair in the forest";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_approach(a, 0, obj_quest_approach_lair_2, 64, UnknownEnum.Value_1);
    global.quest_text_obj[a][0] = "Find the Ghoul's lair";
    a = UnknownEnum.Value_37;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Destroy the Ghoul's lair";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[3];
    global.quest_exp[a] = 110;
    global.quest_rep[a] = rew_rep[1];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_6;
    global.quest_text[a][0] = "Bad news, Hunter.\nWe sent a team to destroy the Ghouls' lair, but we lost contact with them.\nLast we heard, they managed to plant the explosive charges but then something went wrong.\nThere was no explosion, so it didn't end well for them...\nYou seem like a capable guy, so I want to put you in charge of this job.\nBuy some dynamite from our merchant and sneak into the lair, I don't know what you'll find in there so be careful.\nRemember, once you've planted the dynamite, you've got one minute to get out of there.\nGood luck, Hunter!";
    global.quest_text[a][1] = "Destroy the ghoul's lair";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_interact_with_obj(a, 0, obj_quest_destroy_ghoul_lair, 32, "quest_dynamite", "Place dynamite", UnknownEnum.Value_32, UnknownEnum.Value_33);
    global.quest_text_obj[a][0] = "Destroy the Ghoul's lair";
    global.quest_marker[a][0] = true;
    global.quest_marker_sub[a][0] = 3;
    a = UnknownEnum.Value_38;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Cleaning p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[3];
    global.quest_exp[a] = rew_exp[4];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "More and more people want to become Hunters, and while this helps us from one point of view because we have fresh meat to send on suicide missions, on the other hand these Hunters raid the territory in search of fortune.\nGet rid of them but be careful, the same mission will be given to the other Hunters...";
    global.quest_text[a][1] = "Kill 15 bandits in the forest";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_kill(a, 0, 10, "Hunters", -1, ["loner_enemy", "loner_enemy_2"]);
    a = UnknownEnum.Value_40;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "More bandits";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[3];
    global.quest_exp[a] = rew_exp[2];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "Hey Hunter!\nWe have started a cleaning process, we are trying to eliminate the bandits in the area.\nI thought you might be interested in such a job, are you up for it?";
    global.quest_text[a][1] = "Kill 15 bandits in the makeshift camp";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_kill(a, 0, 25, "Bandits", -1, ["bandit_boss", "bandit_boss_guard", "bandit_novice", "bandit_regular"]);
    a = UnknownEnum.Value_39;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Cleaning p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = 6500;
    global.quest_exp[a] = 150;
    global.quest_liv_min[a] = 1;
    global.quest_rep[a] = rew_rep[1];
    global.quest_reward_arr[a] = UnknownEnum.Value_7;
    global.quest_text[a][0] = "Are you ready for some real action? You have to kill Lazar, the leader of the forest bandits.\nHe is located in the police station of the village, maybe you have already met him during one of your hunts.\nPrepare yourself well, he is always surrounded by his guards.\nIt won't be easy to kill him, but afterwards you'll be able to freely enter the police station and take what you want.";
    global.quest_text[a][1] = "Kill Lazar";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_kill(a, 0, 1, -1, -1, ["bandit_boss"]);
    a = UnknownEnum.Value_41;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Mark a working truck";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[2];
    global.quest_exp[a] = rew_exp[0];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "We have noticed that there is a fair amount of trucks in the makeshift camp.\nWe could really use some. Go to the makeshift camp and find a working one, they are located in the road.\nWhen you have found it, place a GPS tracker which you can buy from our merchant, then my men will do the rest.";
    global.quest_text[a][1] = "Find and mark a working truck";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_place_marker(a, 0, obj_truck, UnknownEnum.Value_2);
    global.quest_marker[a][0] = true;
    global.quest_marker_sub[a][0] = 13;
    global.quest_text_obj[a][0] = "Find and mark a working truck";
    a = UnknownEnum.Value_42;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Always in the way";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[2];
    global.quest_exp[a] = rew_exp[4];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "Did you enjoy eliminating the Hunters?\nI hope so since I have another mission for you, this time I want you to eliminate them in the makeshift camp.\nGood luck!";
    global.quest_text[a][1] = "Kill 15 bandits in the forest";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    global.quest_kill_map[a] = UnknownEnum.Value_1;
    scr_quest_create_kill(a, 0, 6, "Hunters", UnknownEnum.Value_2, ["loner_enemy", "loner_enemy_2"]);
    a = UnknownEnum.Value_43;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Motel p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[0];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "Hey Hunter!\nWe know that in the makeshift camp there is an old motel.\nIt should be abandoned by now but I want to make sure. You need to go there and check it out, check the entrance and see if there is a way in.\nUnfortunately we don't know the exact location but it should be easy to spot from the map once you get there, it should be a paved area.";
    global.quest_text[a][1] = "Find the motel";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_approach(a, 0, obj_quest_approach_motel_1, 64, UnknownEnum.Value_2);
    global.quest_text_obj[a][0] = "Find the entrance of the Motel";
    a = UnknownEnum.Value_44;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Motel p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = 3500;
    global.quest_exp[a] = 200;
    global.quest_liv_min[a] = 1;
    global.quest_rep[a] = rew_rep[1];
    global.quest_reward_arr[a] = UnknownEnum.Value_4;
    global.quest_text[a][0] = "Well Hunter, like you said the motel entrance is blocked by cars.\nI told my men to remove them and move in. They didn't find anything good. Looks like a Ghoul infestation there.\nThey saw a strange lump of flesh from which those filthy creatures seem to be emerging.\nBe careful though, we don't know how many there are.";
    global.quest_text[a][1] = "Motel infestation";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_contract(a, 0, obj_enemy_infestation_motel, UnknownEnum.Value_2, "Infestation");
    global.quest_marker[a][0] = true;
    global.quest_marker_sub[a][0] = 3;
    global.quest_text_obj[a][0] = "Eliminate the infestation";
    a = UnknownEnum.Value_45;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Weird phenomena p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = 3000;
    global.quest_exp[a] = 50;
    global.quest_rep[a] = rew_rep[1];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "You must have noticed those bodies at the entrance to the bunker, we don't know what's going on yet.\nSome of ours helicopters crashed in the vicinity of the swamp, no call for help or malfunction, just crashed for no apparent reason.\nWhen they recovered the first bodies, we realised that something very strange was happening in that area.\nDid you see the condition of the bodies? My God, I've never seen anything like it.\nThe last helicopter crashed recently, the rescue operation is dangerous because it is in the middle of the swamp, inaccessible to vehicles.\nYou have to go there and see if you can recover the flight recorder of the helicopter, for the crew I don't think there is much left to do...";
    global.quest_text[a][1] = "Retrieve the flight recorder";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 1, "scatola_nera");
    global.quest_marker[a][0] = true;
    global.quest_marker_sub[a][0] = 13;
    global.quest_text_obj[a][0] = "Recover the flight recorder";
    a = UnknownEnum.Value_46;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Preparing for battle";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[3];
    global.quest_exp[a] = rew_exp[2];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_12;
    global.quest_text[a][0] = "From the helicopter's black box we were able to discover that the crew had spotted a strange purple crystal in the swamp.\nShortly thereafter, there appears to have been an unusual burst of radiation.\nThe crystal appears to be in the swamp village, which is bad news because that place is infested with Ghouls and we blocked the entrance some time ago.\nI'll try to put together a team to exterminate the village, but we need a lot of resources to do it.\nFor now, we're gathering as many resources as you can.\nYou need to do your part too, Hunter.\nOh! And don't forget the Vodka!";
    global.quest_text[a][1] = "Find 250 scrap ammo";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 200, "scrap_ammo");
    scr_quest_create_collect(a, 1, 150, "scrap_weapon");
    scr_quest_create_collect(a, 2, 8, "bandage");
    scr_quest_create_collect(a, 3, 5, "medikit_long");
    scr_quest_create_collect(a, 4, 6, "vodka");
    a = UnknownEnum.Value_47;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Clear the Swamp";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = 6000;
    global.quest_exp[a] = 220;
    global.quest_rep[a] = rew_rep[1];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_8;
    global.quest_text[a][0] = "Here's the plan, Hunter.\nEntering the village with all those Ghouls would be a certain death sentence.\nThe village has only one entrance so we will try to lure them out with a very bright light, so it will have to be done at night.\nGet into the swamp from 10pm to 3am, my men will be waiting for you.\nIt is advisable to bring an automatic weapon or a shotgun with a large magazine so that you have to reload as little as possible.\nOne last thing, in the chaos of battle try not to shoot my men, understand?";
    global.quest_text[a][1] = "Clear the swamp";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    global.quest_type[a][0] = UnknownEnum.Value_20;
    global.quest_amount_now[a][0] = 0;
    global.quest_amount_max[a][0] = 1;
    global.quest_text_obj[a][0] = "Clear the Swamp";
    global.quest_marker[a][0] = true;
    global.quest_marker_sub[a][0] = 3;
    a = UnknownEnum.Value_94;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Inspect the village";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = 6000;
    global.quest_exp[a] = 220;
    global.quest_rep[a] = rew_rep[1];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_21;
    global.quest_text[a][0] = "Haha! Great, Hunter!\nThe plan worked like a charm! Now all we have to do is explore the village and find the purple crystal.\nThere should be a few Ghouls left in the village, I don't think that will be a problem for you.";
    global.quest_text[a][1] = "Inspect the swamp village";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    global.quest_type[a][0] = UnknownEnum.Value_21;
    global.quest_amount_now[a][0] = 0;
    global.quest_amount_max[a][0] = 1;
    global.quest_text_obj[a][0] = "Inspect the village";
    global.quest_marker[a][0] = true;
    global.quest_marker_sub[a][0] = 12;
    a = UnknownEnum.Value_50;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Radioactive meat";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[0];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_0;
    global.quest_text[a][0] = "You're new here, huh?\nWell, I'm always looking for someone to help me with my research.\nDon't worry, I'll pay you for every job you do.\nGood! I need some raw meat to conduct experiments, I want to see how radiation has affected the local fauna.";
    global.quest_text[a][1] = "Find 10 raw meat";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 12, "raw_meat");
    a = UnknownEnum.Value_51;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Strange crystal p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[1];
    global.quest_exp[a] = rew_exp[0];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_0;
    global.quest_text[a][0] = "I don't know how much you have explored but you may have come across strange crystals, they are found near the anomalies.\nWe don't know what they are yet but they seem to be a result of the strange radiation emanating from the nuclear power station.\nGetting hold of some of the crystals would be great, I can't wait to examine them!\nFire crystals are the most common in the forest, so start by bringing me those.";
    global.quest_text[a][1] = "Find 3 fire crystal";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 4, "cristallo_red");
    a = UnknownEnum.Value_52;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Strange crystal p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[3];
    global.quest_exp[a] = rew_exp[3];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_19;
    global.quest_text[a][0] = "Great! Hope you didn't get burned, Hunter! HAHA!\nBring me more crystals, I will pay you!";
    global.quest_text[a][1] = "Find 3 chemical crystal";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 4, "cristallo_verde");
    scr_quest_create_collect(a, 1, 6, "cristallo_red");
    scr_quest_create_collect(a, 2, 2, "cristallo_blu");
    a = UnknownEnum.Value_55;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Pelts p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[0];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_0;
    global.quest_text[a][0] = "Hey Hunter!\nI have a number of very simple jobs to complete.\nI need furs, external radiation is absorbed by the surface layer of the skin and it's a great material for research.\nStart by bringing me some rabbit furs, they are very common on all maps.";
    global.quest_text[a][1] = "Find 5 rabbit pelts";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 10, "rabbit_pelt");
    a = UnknownEnum.Value_56;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Pelts p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[2];
    global.quest_exp[a] = rew_exp[2];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "Good! Now you need to fight a bit.\nIf you find a wolf alone and see it running away it will most likely be going to its pack nearby so always move carefully.";
    global.quest_text[a][1] = "Find 10 wolf pelts";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 8, "wolf_pelt");
    scr_quest_create_collect(a, 1, 6, "boar_pelt");
    a = UnknownEnum.Value_53;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "no data";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[1];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_0;
    global.quest_text[a][0] = "I sent one of my scientists into the forest to study the anomalies, but I haven't heard from him for several hours.\nThis doesn't look good, go check it out. His position will be marked on the map.\nIf he is dead, retrieve the analyser from his body.";
    global.quest_text[a][1] = "Retrieve the analyzer";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_retrieve_analyzer(a, 0, "quest_retrive_analyzer_forest", obj_chest_retrive_analyzer_forest, UnknownEnum.Value_1);
    global.quest_text_obj[a][0] = "Retrieve the analyzer";
    global.quest_marker[a][0] = true;
    global.quest_marker_sub[a][0] = 13;
    a = UnknownEnum.Value_57;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Body parts p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[2];
    global.quest_exp[a] = rew_exp[2];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_0;
    global.quest_text[a][0] = "OK Hunter! The meat samples you brought me showed genetic mutations caused by radiation.\nI need to know more, I need you to bring me body parts of Boars and Ghouls.";
    global.quest_text[a][1] = "Find 5 boar tusks";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 8, "boar_fang");
    scr_quest_create_collect(a, 1, 12, "ghoul_tentacles");
    a = UnknownEnum.Value_58;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Body parts p.2";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[3];
    global.quest_exp[a] = rew_exp[4];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_14;
    global.quest_text[a][0] = "Good! Would you be willing to go into more advanced areas?\nI need spider and blink parts, you can find them in the industrial zone but more easily in the swamp";
    global.quest_text[a][1] = "Find 8 Ghoul tentacles";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 5, "spider_eye");
    scr_quest_create_collect(a, 1, 5, "spider_web");
    scr_quest_create_collect(a, 2, 10, "blink_artiglio");
    a = UnknownEnum.Value_54;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Movies";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[3];
    global.quest_exp[a] = rew_exp[2];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "Hey Hunter!\nSome Hunters managed to get some films on DVD but when we moved here no one thought to bring DVD players or other means of entertainment...\nRetrieve some items for me and I will be able to provide some entertainment for these miserable people";
    global.quest_text[a][1] = "Find 8 Ghoul tentacles";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 4, "dvd_drive");
    scr_quest_create_collect(a, 1, 5, "multi_plug");
    scr_quest_create_collect(a, 2, 5, "power_outlet");
    a = UnknownEnum.Value_59;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "The radio tower";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[1];
    global.quest_exp[a] = rew_exp[2];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "It is time to repair the radio tower in the makeshift camp.\nFirst of all, I would ask you to inspect the radio station. You've probably already noticed all those strange electrical anomalies in the area.\nThe good news is that they can apparently be killed, but that doesn't concern you right now.\nWhat you need to do is find the location of the radio station, which should be easy to find on the map as it is a paved area, and inspect the entrance.\nSee if those strange anomalies are still there.";
    global.quest_text[a][1] = "Locate the radio tower";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_approach(a, 0, obj_quest_approach_fix_radio_tower_1, 40, UnknownEnum.Value_2);
    global.quest_text_obj[a][0] = "Locate the radio tower";
    a = UnknownEnum.Value_60;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Necessary components";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[2];
    global.quest_exp[a] = rew_exp[3];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "We need some electronic equipment so try to accumulate as much as possible.\nFor now we are still inspecting the antenna but we have already noticed that some of the electrical wires are damaged and we need to replace them, so bring me some new ones.";
    global.quest_text[a][1] = "Find 8 wires";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 10, "wires");
    scr_quest_create_collect(a, 1, 6, "relay");
    scr_quest_create_collect(a, 2, 5, "hard_disk");
    a = UnknownEnum.Value_61;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Upgrade";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[4];
    global.quest_exp[a] = rew_exp[4];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_0;
    global.quest_text[a][0] = "Are you in for a hunt for electrical components?\nWe are thinking of upgrading my station and need parts.";
    global.quest_text[a][1] = "Find 8 wires";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 3, "cpu");
    scr_quest_create_collect(a, 1, 1, "ssd");
    scr_quest_create_collect(a, 2, 1, "military_circuit");
    scr_quest_create_collect(a, 3, 8, "bulb");
    a = UnknownEnum.Value_62;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Fix the radio tower";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = 3000;
    global.quest_exp[a] = 50;
    global.quest_rep[a] = rew_rep[1];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_4;
    global.quest_text[a][0] = "Looks like those anomalies are still in the radio station.\nWell, Hunter, you're going to have to fight your way through.\nWhat you need to do is repair the radio tower outside, it's the red and white one with horizontal stripes.\nDon't forget to buy the repair kit from me!";
    global.quest_text[a][1] = "Fix the radio tower";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_interact_with_obj(a, 0, obj_tower_radio_1, 16, "repair_radio_tower", "Fix", UnknownEnum.Value_24, -1);
    global.quest_text_obj[a][0] = "Fix the radio tower";
    global.quest_marker[a][0] = true;
    global.quest_marker_sub[a][0] = 3;
    a = UnknownEnum.Value_63;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Medikit";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[3];
    global.quest_exp[a] = rew_exp[2];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_19;
    global.quest_text[a][0] = "Hey Hunter!\nI'm running low on medikits, so try to get some during your hunts.\nDon't worry, I'll pay you.";
    global.quest_text[a][1] = "Find 15 scrap med";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 20, "scrap_med");
    scr_quest_create_collect(a, 1, 4, "anti_bleed_gel");
    scr_quest_create_collect(a, 2, 4, "medikit_2");
    scr_quest_create_collect(a, 3, 2, "medikit_3");
    a = UnknownEnum.Value_64;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Tons of meds!";
    global.quest_type[a] = "collect";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[3];
    global.quest_exp[a] = rew_exp[4];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_4;
    global.quest_text[a][0] = "Listen, Hunter, there's always a need for medikits here so if you want to bring me more I'll make sure I pay you well.";
    global.quest_text[a][1] = "Find 50 scrap med";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 50, "scrap_med");
    a = UnknownEnum.Value_65;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Radiation effect";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[2];
    global.quest_exp[a] = rew_exp[4];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_18;
    global.quest_text[a][0] = "I would like to examine the effect of radiation on the human body.\nTo do this I need someone who is willing to absorb a large amount of radiation and report the symptoms to me.\nDon't make that face, Hunter. I'm not asking you to do it but if you want to get paid for a simple job here it is.\nYou need to reach the orange radiation level.";
    global.quest_text[a][1] = "Reach orange lvl of radiation";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    global.quest_type[a][0] = UnknownEnum.Value_17;
    global.quest_amount_now[a][0] = 0;
    global.quest_amount_max[a][0] = 1;
    global.quest_text_obj[a][0] = "Reach orange level of radiation";
    a = UnknownEnum.Value_66;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Laboratory p.1";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[1];
    global.quest_exp[a] = rew_exp[3];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "When you went to the radio station you must have noticed the building there, maybe you even tried to go inside.\nWord on the street is that it was an old lab for the Crimson Corporation.\nThe entrance is locked and you need a key card to get in, unfortunately none of us here have one and I don't think the Crimson Corporation will give us one.\nSo I sent my man, Marat Loginov, to look for the key. He seems to have found a damaged one but we may be able to fix it or make a copy.\nMy man is operating in the industrial zone, he has a small base in the north-west, among the abandoned wagons. I haven't heard from him in days, but that's not unusual.\nGo to the industrial area, find him and bring me the key.";
    global.quest_text[a][1] = "Find the laboratory key";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 1, "key_laboratory_rovinata");
    global.quest_text_obj[a][0] = "Retrieve the laboratory key";
    a = UnknownEnum.Value_67;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Laboratory p.2";
    global.quest_type[a] = "collect";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_id_to_collect[a] = "cpu";
    global.quest_stage_completed[a] = 2;
    global.quest_amount_now[a] = 0;
    global.quest_amount_max[a] = 3;
    global.quest_reward[a] = rew_money[4];
    global.quest_exp[a] = rew_exp[3];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_1;
    global.quest_text[a][0] = "So Marat is dead? Man, he was good at his job.\nFortunately, it appears the key you recovered is in good condition. \nNot good enough to use, but we can make a copy.\nAt the moment we don't have the necessary equipment but if you bring me some items we can repair it.";
    global.quest_text[a][1] = "Find 3 CPUs";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 6, "wires");
    scr_quest_create_collect(a, 1, 4, "cpu");
    scr_quest_create_collect(a, 2, 5, "smartphone");
    scr_quest_create_collect(a, 3, 3, "relay");
    scr_quest_create_collect(a, 4, 2, "ssd");
    a = UnknownEnum.Value_68;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Laboratory p.3";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = 10000;
    global.quest_exp[a] = 300;
    global.quest_rep[a] = rew_rep[1];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_12;
    global.quest_text[a][0] = "Great, Hunter!\nNow I can make a copy of the key card for the lab.\nIt will take me a while but I think I will be done by tomorrow morning and you can purchase it from me.\nOnce you've got the key you'll have to make your way to the lab and enter.\nNo one knows what's in there, so be careful. I also suggest you bring a torch because it will be pitch black.\nOnce inside explore it well and try to recover some samples, even I do not know what to look for but I'm sure you'll understand once you find it.\nGood luck, Hunter!";
    global.quest_text[a][1] = "Explore the laboratory";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 1, "flesh_sample");
    global.quest_text_obj[a][0] = "Find evidence in the laboratory";
    a = UnknownEnum.Value_69;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Eyes everywhere";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = 7500;
    global.quest_exp[a] = 100;
    global.quest_rep[a] = rew_rep[1];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_4;
    global.quest_text[a][0] = "So you want to do some missions for crimson Corporation?\nOK, let's start with something simple. As you know our relationship with the green army is not good, so we need to know what their intentions are.\nBuy a CCTV camera from me and place it in the Green Army headquarters in the ZERO Sievert bunker.\nPlace it in the bookshelf, it should be fine there.";
    global.quest_text[a][1] = "Place the CCTV camera";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_interact_with_obj(a, 0, obj_quest_crimson_place_camera, 10, "camera_crimson_quest", "Place camera", UnknownEnum.Value_34, -1);
    global.quest_text_obj[a][0] = "Place the CCTV camera";
    a = UnknownEnum.Value_70;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Cleanup";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = 10000;
    global.quest_exp[a] = 125;
    global.quest_rep[a] = rew_rep[1];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_4;
    global.quest_text[a][0] = "Nice job with the CCTV camera hunter! Thanks to you we know their movements in Zakov.\nNow it's time to do some cleanup eheh.\nKill 15 soldiers of the Green Army. Soldiers patrol the forest and makeshift camps, there are not many of them and unfortunately we do not know their exact location so you will have to find them yourself.\nIf you complete this mission for us, you won't have to pay to enter.";
    global.quest_text[a][1] = "Kill 15 Green Army soldiers";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_kill(a, 0, 15, "Green Army", -1, ["green_army_soldier"]);
    a = UnknownEnum.Value_72;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Materials";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = rew_money[0];
    global.quest_exp[a] = rew_exp[0];
    global.quest_rep[a] = rew_rep[0];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_0;
    global.quest_text[a][0] = "Hey Hunter!\nI can't take you past the makeshift camp because some sections of the railway have to be repaired.\nWe're working on it but if you want to help, it would be quicker.\nBring me these items and we will repair the section.";
    global.quest_text[a][1] = "Collect 40 scrap material";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 40, "scrap_material");
    scr_quest_create_collect(a, 1, 20, "screw_nut");
    scr_quest_create_collect(a, 2, 20, "nail");
    scr_quest_create_collect(a, 3, 1, "screwdriver");
    scr_quest_create_collect(a, 4, 1, "drill");
    scr_quest_create_collect(a, 5, 1, "gas_tank");
    a = UnknownEnum.Value_71;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Meat for Igor";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = 2500;
    global.quest_exp[a] = 40;
    global.quest_rep[a] = rew_rep[1];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_0;
    global.quest_text[a][0] = "Would you bring me 10 pieces of raw meat?\nYou'd be doing me a big favour.";
    global.quest_text[a][1] = "Collect 10 raw meat";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 10, "raw_meat");
    a = UnknownEnum.Value_172;
    i = 0;
    global.quest_id[a] = a;
    global.quest_name[a] = "Grigoriy's ring";
    global.quest_is_unique[a] = true;
    global.quest_unique_done[a] = false;
    global.quest_stage_completed[a] = 2;
    global.quest_reward[a] = 0;
    global.quest_exp[a] = 120;
    global.quest_rep[a] = rew_rep[1];
    global.quest_liv_min[a] = 1;
    global.quest_reward_arr[a] = UnknownEnum.Value_22;
    global.quest_text[a][0] = "Oh! Oh! Can you do something for Mr. Junk?\nNow that Grigoriy has come back to life he would love to get his ring back.\nMr. Junk hid it in the swamp before he came to this place.\nIf you do this for Mr. Junk then he will sell you some of his treasure.\nNo! No! No! Mr. Junk loves his treasure...\nOh! Oh! But it's more important to make Grigoriy happy.\nYes! Yes! Yes!\nYou bring Mr. Junk the ring and he'll sell you some of his treasure.\nMr. Junk will also give you this costume he found";
    global.quest_text[a][1] = "Retrieve Grigoriy's ring";
    global.quest_text[a][2] = quest_completed;
    global.quest_text[a][3] = thank_for_help;
    scr_quest_create_collect(a, 0, 1, "ring_grigory");
    i = 0;
    var _quest_type;
    _quest_type[i] = "kill";
    var _quest_type_chance;
    _quest_type_chance[i] = 3;
    j = 0;
    var _quest_obj;
    _quest_obj[i][j] = ["bandit_boss", "bandit_boss_guard", "bandit_novice", "bandit_regular"];
    var _quest_faction;
    _quest_faction[i][j] = "Bandits";
    var _quest_amount;
    _quest_amount[i][j] = 5;
    var _quest_map;
    _quest_map[i][j] = -1;
    var _quest_chance;
    _quest_chance[i][j] = 4;
    var _quest_min_level;
    _quest_min_level[i][j] = 1;
    j++;
    _quest_obj[i][j] = ["ghoul"];
    _quest_faction[i][j] = -1;
    _quest_amount[i][j] = 5;
    _quest_map[i][j] = -1;
    _quest_chance[i][j] = 3;
    _quest_min_level[i][j] = 1;
    j++;
    _quest_obj[i][j] = ["rabbit"];
    _quest_faction[i][j] = -1;
    _quest_amount[i][j] = 5;
    _quest_map[i][j] = [UnknownEnum.Value_1, UnknownEnum.Value_2];
    _quest_chance[i][j] = 2;
    _quest_min_level[i][j] = 1;
    j++;
    _quest_obj[i][j] = ["wolf_brown"];
    _quest_faction[i][j] = -1;
    _quest_amount[i][j] = 5;
    _quest_map[i][j] = [UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3];
    _quest_chance[i][j] = 3;
    _quest_min_level[i][j] = 1;
    j++;
    _quest_obj[i][j] = ["boar"];
    _quest_faction[i][j] = -1;
    _quest_amount[i][j] = 2;
    _quest_map[i][j] = [UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3];
    _quest_chance[i][j] = 3;
    _quest_min_level[i][j] = 1;
    j++;
    _quest_obj[i][j] = ["blink"];
    _quest_faction[i][j] = -1;
    _quest_amount[i][j] = 2;
    _quest_map[i][j] = [UnknownEnum.Value_3, UnknownEnum.Value_4, UnknownEnum.Value_6];
    _quest_chance[i][j] = 2;
    _quest_min_level[i][j] = 3;
    j++;
    _quest_obj[i][j] = ["big"];
    _quest_faction[i][j] = -1;
    _quest_amount[i][j] = 1;
    _quest_map[i][j] = [UnknownEnum.Value_4, UnknownEnum.Value_6];
    _quest_chance[i][j] = 2;
    _quest_min_level[i][j] = 3;
    j++;
    _quest_obj[i][j] = ["loner_enemy", "loner_enemy_2"];
    _quest_faction[i][j] = "Hunters";
    _quest_amount[i][j] = 2;
    _quest_map[i][j] = -1;
    _quest_chance[i][j] = 3;
    _quest_min_level[i][j] = 1;
    j++;
    _quest_obj[i][j] = ["spider"];
    _quest_faction[i][j] = -1;
    _quest_amount[i][j] = 2;
    _quest_map[i][j] = [UnknownEnum.Value_3, UnknownEnum.Value_4];
    _quest_chance[i][j] = 2;
    _quest_min_level[i][j] = 3;
    j++;
    _quest_obj[i][j] = ["bandit_boss"];
    _quest_faction[i][j] = -1;
    _quest_amount[i][j] = 1;
    _quest_map[i][j] = [UnknownEnum.Value_1];
    _quest_chance[i][j] = 1;
    _quest_min_level[i][j] = 3;
    j++;
    _quest_obj[i][j] = ["arman"];
    _quest_faction[i][j] = -1;
    _quest_amount[i][j] = 1;
    _quest_map[i][j] = [UnknownEnum.Value_2];
    _quest_chance[i][j] = 1;
    _quest_min_level[i][j] = 3;
    j++;
    _quest_obj[i][j] = ["killa"];
    _quest_faction[i][j] = -1;
    _quest_amount[i][j] = 1;
    _quest_map[i][j] = [UnknownEnum.Value_6];
    _quest_chance[i][j] = 1;
    _quest_min_level[i][j] = 4;
    i++;
    j = 0;
    _quest_type[i] = "collect";
    _quest_type_chance[i] = 3;
    _quest_obj[i][j] = "tushonka_meat";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "tushonka_fish";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "mre";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "bread";
    _quest_amount[i][j] = 4;
    j++;
    _quest_obj[i][j] = "russian_chocolate";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "generic_chocolate";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "crackers";
    _quest_amount[i][j] = 4;
    j++;
    _quest_obj[i][j] = "pasta";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "canned_beans";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "chips";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "salame";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "wurstel";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "butter";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "cheese";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "water_bottle";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "milk";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "vodka";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "fruit_juice";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "coke";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "energy_drink";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "red_cigarettes";
    _quest_amount[i][j] = 4;
    j++;
    _quest_obj[i][j] = "blue_cigarettes";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "raw_meat";
    _quest_amount[i][j] = 8;
    j++;
    _quest_obj[i][j] = "wolf_pelt";
    _quest_amount[i][j] = 5;
    j++;
    _quest_obj[i][j] = "boar_pelt";
    _quest_amount[i][j] = 3;
    j++;
    _quest_obj[i][j] = "rabbit_pelt";
    _quest_amount[i][j] = 5;
    j++;
    _quest_obj[i][j] = "boar_fang";
    _quest_amount[i][j] = 3;
    j++;
    _quest_obj[i][j] = "blink_artiglio";
    _quest_amount[i][j] = 4;
    j++;
    _quest_obj[i][j] = "devourer_tooth";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "ghoul_tentacles";
    _quest_amount[i][j] = 5;
    j++;
    _quest_obj[i][j] = "spider_eye";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "spider_web";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "drill";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "screwdriver";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "wrench";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "nail";
    _quest_amount[i][j] = 20;
    j++;
    _quest_obj[i][j] = "pliers";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "hammer";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "rope";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "paint_white";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "dutch_tape";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "metal_pipe";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "spark_plug";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "car_battery";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "alchool";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "wheel";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "engine_oil";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "screw_nut";
    _quest_amount[i][j] = 15;
    j++;
    _quest_obj[i][j] = "bolt_cutter";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "spray_bug";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "gas_tank";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "carbone";
    _quest_amount[i][j] = 3;
    j++;
    _quest_obj[i][j] = "metro";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "hose";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "battery";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "bulb";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "electric_motor";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "hard_disk";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "wires";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "usb";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "gamestation";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "smartphone";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "relay";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "ram";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "cpu";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "multi_plug";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "power_bank";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "hair_dryer";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "fan";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "power_outlet";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "ssd";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "military_circuit";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "dvd_drive";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "knife";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "spoon";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "fork";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "matches";
    _quest_amount[i][j] = 4;
    j++;
    _quest_obj[i][j] = "lighter";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "coffee";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "paper";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "soap";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "zippo";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "toilet_paper";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "shampoo";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "tea_bag";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "salt";
    _quest_amount[i][j] = 4;
    j++;
    _quest_obj[i][j] = "pepper";
    _quest_amount[i][j] = 4;
    j++;
    _quest_obj[i][j] = "pillow";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "pot_cooking";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "dumbell";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "wristwatch";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "wristwatch_gold";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "fragrance";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "zippo_gold";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "bracelet_silver";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "bracelet_gold";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "necklace_gold";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "injector_vuoto";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "scissors_surgery";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "medikit_1";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "medikit_2";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "medikit_3";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "medikit_long";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "bandage";
    _quest_amount[i][j] = 3;
    j++;
    _quest_obj[i][j] = "pills_anti_rad";
    _quest_amount[i][j] = 3;
    j++;
    _quest_obj[i][j] = "anti_bleed_gel";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "med_wound_1";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "med_wound_2";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "bandage_sterilizzata";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "injector1";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "injector2";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "injector3";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "injector7";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "injector4";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "injector5";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "injector6";
    _quest_amount[i][j] = 1;
    j++;
    _quest_obj[i][j] = "cristallo_red";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "cristallo_blu";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "cristallo_verde";
    _quest_amount[i][j] = 2;
    j++;
    _quest_obj[i][j] = "scrap_material";
    _quest_amount[i][j] = 20;
    j++;
    _quest_obj[i][j] = "scrap_food";
    _quest_amount[i][j] = 10;
    j++;
    _quest_obj[i][j] = "scrap_ammo";
    _quest_amount[i][j] = 70;
    j++;
    _quest_obj[i][j] = "scrap_med";
    _quest_amount[i][j] = 10;
    j++;
    _quest_obj[i][j] = "scrap_weapon";
    _quest_amount[i][j] = 20;
    j++;
    
    for (var g = 0; g < array_length(_quest_obj[i]); g++)
    {
        _quest_min_level[i][g] = 1;
        _quest_chance[i][g] = 1;
    }
    
    i++;
    j = 0;
    _quest_type[i] = "contract";
    _quest_type_chance[i] = 3;
    _quest_obj[i][j] = obj_enemy_human_bandit_novice;
    _quest_min_level[i][j] = 1;
    _quest_chance[i][j] = 3;
    _quest_map[i][j] = -1;
    var _quest_obj_name;
    _quest_obj_name[i][j] = "Bandit";
    j++;
    _quest_obj[i][j] = obj_enemy_human_bandit_regular;
    _quest_min_level[i][j] = 1;
    _quest_chance[i][j] = 3;
    _quest_map[i][j] = -1;
    _quest_obj_name[i][j] = "Bandit";
    j++;
    _quest_obj[i][j] = obj_enemy_big;
    _quest_min_level[i][j] = 4;
    _quest_chance[i][j] = 2;
    _quest_map[i][j] = -1;
    _quest_obj_name[i][j] = "Big";
    j++;
    _quest_obj[i][j] = obj_loner_enemy;
    _quest_min_level[i][j] = 1;
    _quest_chance[i][j] = 3;
    _quest_map[i][j] = -1;
    _quest_obj_name[i][j] = "Hunter";
    j++;
    _quest_obj[i][j] = obj_loner_enemy2;
    _quest_min_level[i][j] = 3;
    _quest_chance[i][j] = 3;
    _quest_map[i][j] = -1;
    _quest_obj_name[i][j] = "Hunter";
    j++;
    _quest_obj[i][j] = obj_enemy_infestation;
    _quest_min_level[i][j] = 2;
    _quest_chance[i][j] = 3;
    _quest_map[i][j] = -1;
    _quest_obj_name[i][j] = "Infestation";
    j++;
    _quest_obj[i][j] = obj_green_army_soldier1;
    _quest_min_level[i][j] = 2;
    _quest_chance[i][j] = 3;
    _quest_map[i][j] = -1;
    _quest_obj_name[i][j] = "Green Army soldier";
    j++;
    _quest_obj[i][j] = obj_crimson_soldier;
    _quest_min_level[i][j] = 2;
    _quest_chance[i][j] = 3;
    _quest_map[i][j] = -1;
    _quest_obj_name[i][j] = "CC soldier";
    i++;
    j = 0;
    _quest_type[i] = "survive";
    _quest_type_chance[i] = 2;
    _quest_map[i][j] = UnknownEnum.Value_1;
    _quest_amount[i][j] = 2;
    _quest_chance[i][j] = 1;
    _quest_min_level[i][j] = 1;
    _quest_obj[i][j] = 0;
    j++;
    _quest_map[i][j] = UnknownEnum.Value_2;
    _quest_amount[i][j] = 2;
    _quest_chance[i][j] = 1;
    _quest_min_level[i][j] = 1;
    _quest_obj[i][j] = 0;
    j++;
    _quest_map[i][j] = UnknownEnum.Value_3;
    _quest_amount[i][j] = 1;
    _quest_chance[i][j] = 1;
    _quest_min_level[i][j] = 3;
    _quest_obj[i][j] = 0;
    j++;
    _quest_map[i][j] = UnknownEnum.Value_4;
    _quest_amount[i][j] = 1;
    _quest_chance[i][j] = 1;
    _quest_min_level[i][j] = 3;
    _quest_obj[i][j] = 0;
    j++;
    _quest_map[i][j] = UnknownEnum.Value_6;
    _quest_amount[i][j] = 1;
    _quest_chance[i][j] = 1;
    _quest_min_level[i][j] = 3;
    _quest_obj[i][j] = 0;
    i++;
    j = 0;
    _quest_type[i] = "survive_exp";
    _quest_type_chance[i] = 1;
    _quest_map[i][j] = [UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_4, UnknownEnum.Value_6];
    _quest_amount[i][j] = 125;
    _quest_chance[i][j] = 1;
    _quest_min_level[i][j] = 1;
    _quest_obj[i][j] = 0;
    j++;
    _quest_map[i][j] = -1;
    _quest_amount[i][j] = 125;
    _quest_chance[i][j] = 2;
    _quest_min_level[i][j] = 1;
    _quest_obj[i][j] = 0;
    i++;
    j = 0;
    _quest_type[i] = "survive_money";
    _quest_type_chance[i] = 1;
    _quest_map[i][j] = [UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_4, UnknownEnum.Value_6];
    _quest_amount[i][j] = 7500;
    _quest_chance[i][j] = 1;
    _quest_min_level[i][j] = 1;
    _quest_obj[i][j] = 0;
    j++;
    _quest_map[i][j] = -1;
    _quest_amount[i][j] = 7500;
    _quest_chance[i][j] = 2;
    _quest_min_level[i][j] = 1;
    _quest_obj[i][j] = 0;
    db_open("general");
    global.daily_quest_generated = db_read("quest", "daily generated", false);
    db_close();
    a = UnknownEnum.Value_173;
    
    while (a <= UnknownEnum.Value_176)
    {
        global.quest_id[a] = a;
        global.quest_name[a] = "";
        global.quest_is_unique[a] = false;
        global.quest_unique_done[a] = false;
        global.quest_is_daily[a] = true;
        global.quest_stage_completed[a] = 2;
        global.quest_is_removable[a] = true;
        global.quest_reward[a] = 0;
        global.quest_exp[a] = 0;
        global.quest_rep[a] = 0;
        global.quest_liv_min[a] = 1;
        global.quest_reward_arr[a] = 0;
        global.quest_text[a][0] = "";
        global.quest_text[a][1] = "";
        a++;
    }
    
    if (global.daily_quest_generated == false)
    {
        i = UnknownEnum.Value_173;
        var _create_new;
        
        while (i <= UnknownEnum.Value_176)
        {
            _create_new[i] = true;
            i++;
        }
        
        db_open("general");
        i = UnknownEnum.Value_173;
        
        while (i <= UnknownEnum.Value_176)
        {
            for (j = 0; j < 30; j++)
            {
                var _quest_id = db_read("Quest", string(j) + "_id", -1);
                
                if (_quest_id == i)
                    _create_new[i] = false;
            }
            
            i++;
        }
        
        db_close();
        db_open("general");
        var _user_lvl = db_read("Exp", "Livello", 1);
        db_close();
        var _n_generated = -1;
        i = UnknownEnum.Value_173;
        
        while (i <= UnknownEnum.Value_176)
        {
            _n_generated++;
            
            if (_create_new[i] == true)
            {
                var _quest_objective_choosed;
                
                for (var b = 0; b < array_length(_quest_type); b++)
                {
                    for (var c = 0; c < array_length(_quest_obj[b]); c++)
                        _quest_objective_choosed[b][c] = false;
                }
                
                var _quest_reward_money = 0;
                var _quest_reward_exp = 0;
                var _n_objectives = 2 + _n_generated;
                
                for (j = 0; j < _n_objectives; j++)
                {
                    var _index = -1;
                    var _second_entry_index = -1;
                    var _n_quest_type = array_length(_quest_type);
                    var _array_chance = [];
                    
                    for (var k = 0; k < _n_quest_type; k++)
                    {
                        repeat (_quest_type_chance[k])
                            array_push(_array_chance, k);
                    }
                    
                    var _array_length = array_length(_array_chance);
                    var _quest_type_selected = _quest_type[_array_chance[irandom(_array_length - 1)]];
                    var _already_generated = true;
                    
                    while (_already_generated == true)
                    {
                        _quest_type_selected = _quest_type[_array_chance[irandom(_array_length - 1)]];
                        
                        switch (_quest_type_selected)
                        {
                            case "kill":
                                _index = array_find_index(_quest_type, "kill");
                                break;
                            
                            case "collect":
                                _index = array_find_index(_quest_type, "collect");
                                break;
                            
                            case "contract":
                                _index = array_find_index(_quest_type, "contract");
                                break;
                            
                            case "survive":
                                _index = array_find_index(_quest_type, "survive");
                                break;
                            
                            case "survive_exp":
                                _index = array_find_index(_quest_type, "survive_exp");
                                break;
                            
                            case "survive_money":
                                _index = array_find_index(_quest_type, "survive_money");
                                break;
                        }
                        
                        var _size_second_entry = array_length(_quest_obj[_index]);
                        var _array_chance2 = [];
                        
                        for (var k = 0; k < _size_second_entry; k++)
                        {
                            if (_user_lvl >= _quest_min_level[_index][k])
                            {
                                repeat (_quest_chance[_index][k])
                                    array_push(_array_chance2, k);
                            }
                        }
                        
                        _second_entry_index = _array_chance2[irandom(array_length(_array_chance2) - 1)];
                        
                        if (_second_entry_index != -1 && _index != -1)
                        {
                            if (_quest_objective_choosed[_index][_second_entry_index] == false)
                            {
                                _quest_objective_choosed[_index][_second_entry_index] = true;
                                _already_generated = false;
                            }
                        }
                    }
                    
                    switch (_quest_type_selected)
                    {
                        case "kill":
                            var _diff_multiplier = 1 + _n_generated;
                            var _amount_to_kill = round(_quest_amount[_index][_second_entry_index] * _diff_multiplier);
                            var _choosed_quest_map;
                            
                            if (_quest_map[_index][_second_entry_index] == -1)
                            {
                                if (_user_lvl < 3)
                                {
                                    if (scr_chance(50))
                                        _choosed_quest_map = choose(UnknownEnum.Value_1, UnknownEnum.Value_2);
                                    else
                                        _choosed_quest_map = -1;
                                }
                                else if (scr_chance(50))
                                {
                                    _choosed_quest_map = choose(UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_4, UnknownEnum.Value_6);
                                }
                                else
                                {
                                    _choosed_quest_map = -1;
                                }
                            }
                            else
                            {
                                var _array_map = _quest_map[_index][_second_entry_index];
                                _choosed_quest_map = _array_map[irandom(array_length(_array_map) - 1)];
                            }
                            
                            scr_quest_create_kill(i, j, _amount_to_kill, _quest_faction[_index][_second_entry_index], _choosed_quest_map, _quest_obj[_index][_second_entry_index]);
                            _quest_reward_money += round(400 * _diff_multiplier);
                            _quest_reward_exp += round(10 * _diff_multiplier);
                            break;
                        
                        case "collect":
                            var _item_to_collect = _quest_obj[_index][_second_entry_index];
                            var _diff_multiplier = 1 + (_n_generated / 2);
                            var _amount_to_collect = round(_quest_amount[_index][_second_entry_index] * _diff_multiplier);
                            _amount_to_collect = clamp(_amount_to_collect, 1, 999);
                            scr_quest_create_collect(i, j, _amount_to_collect, _item_to_collect);
                            _quest_reward_money += round(item_get_value(_item_to_collect) * _amount_to_collect * difficulty_get("trade_sell_mult") * 0.75);
                            _quest_reward_exp += round(10 * _diff_multiplier);
                            break;
                        
                        case "contract":
                            var _kill_obj_instance = _quest_obj[_index][_second_entry_index];
                            var _diff_multiplier = 1 + ((_n_generated * 2) / 10);
                            var _choosed_quest_map;
                            
                            if (_quest_map[_index][_second_entry_index] == -1)
                            {
                                if (_user_lvl < 3)
                                    _choosed_quest_map = choose(UnknownEnum.Value_1, UnknownEnum.Value_2);
                                else
                                    _choosed_quest_map = choose(UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_4, UnknownEnum.Value_6);
                            }
                            else
                            {
                                _choosed_quest_map = _quest_map[_index][_second_entry_index];
                            }
                            
                            scr_quest_create_contract(i, j, _kill_obj_instance, _choosed_quest_map, _quest_obj_name[_index][_second_entry_index]);
                            _quest_reward_money += round(400 * _diff_multiplier);
                            _quest_reward_exp += round(10 * _diff_multiplier);
                            break;
                        
                        case "survive":
                            var _diff_multiplier = 1 + (_n_generated / 4);
                            var _choosed_quest_map = _quest_map[_index][_second_entry_index];
                            var _amount_to_survive = round(_quest_amount[_index][_second_entry_index] * _diff_multiplier);
                            scr_quest_create_survive_map(i, j, _amount_to_survive, _choosed_quest_map);
                            _quest_reward_money += round(250 * _diff_multiplier);
                            _quest_reward_exp += round(10 * _diff_multiplier);
                            break;
                        
                        case "survive_exp":
                            var _diff_multiplier = (1 + (_n_generated / 3)) * random_range(0.8, 1.2);
                            var _choosed_quest_map;
                            
                            if (_quest_map[_index][_second_entry_index] != -1)
                            {
                                var _array_map = _quest_map[_index][_second_entry_index];
                                _choosed_quest_map = _array_map[irandom(array_length(_array_map) - 1)];
                                
                                if (_user_lvl < 3)
                                    _choosed_quest_map = choose(UnknownEnum.Value_1, UnknownEnum.Value_2);
                            }
                            else
                            {
                                _choosed_quest_map = -1;
                            }
                            
                            var _exp_min = round(_quest_amount[_index][_second_entry_index] * _diff_multiplier) + irandom_range(-25, 25);
                            scr_quest_create_survive_min_exp(i, j, 1, _choosed_quest_map, _exp_min);
                            _quest_reward_money += round(250 * _diff_multiplier);
                            _quest_reward_exp += round(12 * _diff_multiplier);
                            break;
                        
                        case "survive_money":
                            var _diff_multiplier = (1 + (_n_generated / 3)) * random_range(0.8, 1.2);
                            var _choosed_quest_map;
                            
                            if (_quest_map[_index][_second_entry_index] != -1)
                            {
                                var _array_map = _quest_map[_index][_second_entry_index];
                                _choosed_quest_map = _array_map[irandom(array_length(_array_map) - 1)];
                                
                                if (_user_lvl < 3)
                                    _choosed_quest_map = choose(UnknownEnum.Value_1, UnknownEnum.Value_2);
                            }
                            else
                            {
                                _choosed_quest_map = -1;
                            }
                            
                            var _roubles_min = round(_quest_amount[_index][_second_entry_index] * _diff_multiplier * random_range(0.9, 1.1));
                            scr_quest_create_survive_min_roubles(i, j, 1, _choosed_quest_map, _roubles_min);
                            _quest_reward_money += round(250 * _diff_multiplier);
                            _quest_reward_exp += round(12 * _diff_multiplier);
                            break;
                    }
                }
                
                global.quest_reward[i] = _quest_reward_money;
                global.quest_exp[i] = _quest_reward_exp;
                var _list_reward = UnknownEnum.Value_29;
                
                if (i == UnknownEnum.Value_173)
                    _list_reward = UnknownEnum.Value_29;
                
                if (i == UnknownEnum.Value_174)
                    _list_reward = UnknownEnum.Value_30;
                
                if (i == UnknownEnum.Value_175)
                    _list_reward = UnknownEnum.Value_31;
                
                if (i == UnknownEnum.Value_176)
                    _list_reward = UnknownEnum.Value_32;
                
                global.quest_reward_arr[i] = _list_reward;
                var get_list = global.list_reward_quest[_list_reward];
                ds_list_shuffle(get_list);
                var c_reward = ds_list_find_value(get_list, 0);
                global.quest_daily_reward[i] = c_reward;
            }
            
            i++;
        }
        
        db_open("general");
        i = UnknownEnum.Value_173;
        
        while (i <= UnknownEnum.Value_176)
        {
            if (_create_new[i] == true)
            {
                db_write("Quest", string(i) + "_daily_name", "Daily " + string((i - UnknownEnum.Value_173) + 1));
                db_write("Quest", string(i) + "_daily_reward_money", global.quest_reward[i]);
                db_write("Quest", string(i) + "_daily_reward", global.quest_daily_reward[i]);
                db_write("Quest", string(i) + "_daily_exp", global.quest_exp[i]);
                db_write("Quest", string(i) + "_daily_text", " ");
                
                for (j = 0; j < array_length(global.quest_type[i]); j++)
                {
                    db_write("Quest", string(i) + "_daily_quest_type" + string(j), global.quest_type[i][j]);
                    
                    switch (global.quest_type[i][j])
                    {
                        case "kill":
                            db_write("Quest", string(i) + "_daily_obj_" + string(j), global.quest_kill_arr_obj[i][j]);
                            db_write("Quest", string(i) + "_daily_amount_max_" + string(j), global.quest_amount_max[i][j]);
                            db_write("Quest", string(i) + "_daily_kill_faction_" + string(j), global.quest_kill_faction[i][j]);
                            db_write("Quest", string(i) + "_daily_map_" + string(j), global.quest_kill_map[i][j]);
                            break;
                        
                        case "collect":
                            db_write("Quest", string(i) + "_daily_obj_" + string(j), global.quest_collect_item[i][j]);
                            db_write("Quest", string(i) + "_daily_amount_max_" + string(j), global.quest_amount_max[i][j]);
                            break;
                        
                        case "contract":
                            db_write("Quest", string(i) + "_daily_obj_" + string(j), global.quest_obj_to_kill[i][j]);
                            db_write("Quest", string(i) + "_daily_amount_max_" + string(j), global.quest_amount_max[i][j]);
                            db_write("Quest", string(i) + "_daily_map_" + string(j), global.quest_contract_map[i][j]);
                            db_write("Quest", string(i) + "_daily_obj_name" + string(j), global.quest_contract_obj_name[i][j]);
                            break;
                        
                        case "survive":
                            db_write("Quest", string(i) + "_daily_amount_max_" + string(j), global.quest_amount_max[i][j]);
                            db_write("Quest", string(i) + "_daily_map_" + string(j), global.quest_survive_map[i][j]);
                            break;
                        
                        case "survive_exp":
                            db_write("Quest", string(i) + "_daily_amount_max_" + string(j), global.quest_amount_max[i][j]);
                            db_write("Quest", string(i) + "_daily_survive_exp_" + string(j), global.quest_survive_min_exp[i][j]);
                            db_write("Quest", string(i) + "_daily_map_" + string(j), global.quest_survive_map[i][j]);
                            break;
                        
                        case "survive_money":
                            db_write("Quest", string(i) + "_daily_amount_max_" + string(j), global.quest_amount_max[i][j]);
                            db_write("Quest", string(i) + "_daily_survive_roubles_" + string(j), global.quest_survive_min_roubles[i][j]);
                            db_write("Quest", string(i) + "_daily_map_" + string(j), global.quest_survive_map[i][j]);
                            break;
                    }
                }
            }
            
            i++;
        }
        
        db_close();
        global.daily_quest_generated = true;
        db_open("general");
        db_write("quest", "daily generated", true);
        db_close();
    }
    
    db_open("general");
    a = UnknownEnum.Value_173;
    
    while (a <= UnknownEnum.Value_176)
    {
        global.quest_id[a] = a;
        global.quest_name[a] = db_read("Quest", string(a) + "_daily_name", "Daily " + string(a - UnknownEnum.Value_173));
        global.quest_reward[a] = db_read("Quest", string(a) + "_daily_reward_money", 0);
        global.quest_daily_reward[a] = db_read("Quest", string(a) + "_daily_reward", 0);
        global.quest_exp[a] = db_read("Quest", string(a) + "_daily_exp", 0);
        global.quest_text[a][0] = db_read("Quest", string(a) + "_daily_text", "test");
        
        for (j = 0; j < 7; j++)
        {
            global.quest_amount_max[a][j] = 0;
            var _sub_quest_type = db_read("Quest", string(a) + "_daily_quest_type" + string(j), -1);
            
            if (_sub_quest_type != -1)
            {
                global.quest_type[a][j] = _sub_quest_type;
                
                switch (global.quest_type[a][j])
                {
                    case "kill":
                        global.quest_kill_arr_obj[a][j] = db_read("Quest", string(a) + "_daily_obj_" + string(j), 0);
                        global.quest_amount_max[a][j] = db_read("Quest", string(a) + "_daily_amount_max_" + string(j), 0);
                        global.quest_kill_faction[a][j] = db_read("Quest", string(a) + "_daily_kill_faction_" + string(j), -1);
                        global.quest_kill_map[a][j] = db_read("Quest", string(a) + "_daily_map" + string(j), -1);
                        break;
                    
                    case "collect":
                        global.quest_collect_item[a][j] = db_read("Quest", string(a) + "_daily_obj_" + string(j), "no_item");
                        global.quest_amount_max[a][j] = db_read("Quest", string(a) + "_daily_amount_max_" + string(j), 0);
                        break;
                    
                    case "contract":
                        global.quest_obj_to_kill[a][j] = db_read("Quest", string(a) + "_daily_obj_" + string(j), -4);
                        global.quest_amount_max[a][j] = db_read("Quest", string(a) + "_daily_amount_max_" + string(j), 1);
                        global.quest_contract_map[a][j] = db_read("Quest", string(a) + "_daily_map_" + string(j), -1);
                        global.quest_contract_obj_name[a][j] = db_read("Quest", string(a) + "_daily_obj_name" + string(j), "");
                        break;
                    
                    case "survive":
                        global.quest_amount_max[a][j] = db_read("Quest", string(a) + "_daily_amount_max_" + string(j), 1);
                        global.quest_survive_map[a][j] = db_read("Quest", string(a) + "_daily_map_" + string(j), -1);
                        break;
                    
                    case "survive_exp":
                        global.quest_amount_max[a][j] = db_read("Quest", string(a) + "_daily_amount_max_" + string(j), 1);
                        global.quest_survive_map[a][j] = db_read("Quest", string(a) + "_daily_map_" + string(j), -1);
                        global.quest_survive_min_exp[a][j] = db_read("Quest", string(a) + "_daily_survive_exp_" + string(j), 1);
                        break;
                    
                    case "survive_money":
                        global.quest_amount_max[a][j] = db_read("Quest", string(a) + "_daily_amount_max_" + string(j), 1);
                        global.quest_survive_map[a][j] = db_read("Quest", string(a) + "_daily_map_" + string(j), -1);
                        global.quest_survive_min_roubles[a][j] = db_read("Quest", string(a) + "_daily_survive_roubles_" + string(j), 1);
                        break;
                }
            }
        }
        
        a++;
    }
    
    db_close();
    
    for (i = 0; i < UnknownEnum.Value_177; i++)
        global.quest_reward[i] = round(global.quest_reward[i] * difficulty_get("pro_quest_money"));
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_47,
    Value_50 = 50,
    Value_51,
    Value_52,
    Value_53,
    Value_54,
    Value_55,
    Value_56,
    Value_57,
    Value_58,
    Value_59,
    Value_60,
    Value_61,
    Value_62,
    Value_63,
    Value_64,
    Value_65,
    Value_66,
    Value_67,
    Value_68,
    Value_69,
    Value_70,
    Value_71,
    Value_72,
    Value_89 = 89,
    Value_90,
    Value_94 = 94,
    Value_172 = 172,
    Value_173,
    Value_174,
    Value_175,
    Value_176,
    Value_177
}
