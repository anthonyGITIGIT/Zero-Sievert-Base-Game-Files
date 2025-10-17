global.struct_faction = {};
global.struct_faction.Player = 
{
    id: "Player",
    name: "Player",
    index: 0,
    rep_hit: 0,
    rep_amount_no_join: 1000,
    rep_daily: 8
};
global.struct_faction.Loners = 
{
    id: "Loners",
    name: "Loners",
    index: 1,
    rep_hit: -1,
    rep_amount_no_join: 1000,
    rep_daily: 8
};
variable_struct_set(global.struct_faction, "Green Army", 
{
    id: "Green Army",
    name: "Green Army",
    index: 2,
    rep_hit: -1,
    rep_amount_no_join: 600,
    rep_daily: 8
});
variable_struct_set(global.struct_faction, "Crimson Corporation", 
{
    id: "Crimson Corporation",
    name: "Crimson Corporation",
    index: 3,
    rep_hit: -1,
    rep_amount_no_join: 600,
    rep_daily: 8
});
global.struct_faction.Scientists = 
{
    id: "Scientists",
    name: "Scientists",
    index: 4,
    rep_hit: -1,
    rep_amount_no_join: 1000,
    rep_daily: 15
};
global.struct_faction.Bandits = 
{
    id: "Bandits",
    name: "Bandits",
    index: 5,
    rep_hit: -1,
    rep_amount_no_join: 1000,
    rep_daily: 8
};
global.struct_faction.Mutants = 
{
    id: "Mutants",
    name: "Mutants",
    index: 6,
    rep_hit: -1,
    rep_amount_no_join: 1000,
    rep_daily: 8
};
variable_struct_set(global.struct_faction, "All Enemy", 
{
    id: "All Enemy",
    name: "All Enemy",
    index: 7,
    rep_hit: -1,
    rep_amount_no_join: 1000,
    rep_daily: 8
});
variable_struct_set(global.struct_faction, "All Friend", 
{
    id: "All Friend",
    name: "All Friend",
    index: 8,
    rep_hit: 0,
    rep_amount_no_join: 1000,
    rep_daily: 8
});
global.struct_faction.Watcher = 
{
    id: "Watcher",
    name: "Watcher",
    index: 9,
    rep_hit: 0,
    rep_amount_no_join: 1000,
    rep_daily: 8
};
