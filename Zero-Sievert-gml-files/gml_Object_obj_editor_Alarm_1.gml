var _datafiles_directory = filename_dir("C:\\Users\\carbo\\Documents\\GameMakerStudio2\\ZERO_Sievert\\Project\\ZERO_Sievert.yyp\\ZERO_Sievert.yyp") + "\\datafiles\\";
var _building_name = room_get_name(room);
var _filename = _building_name + ".bin";
var _destination = _datafiles_directory + _filename;
buffer_save(building_serialize(_building_name, mode, {}), _destination);
building_index_add(_building_name, _filename);
building_index_save(_datafiles_directory + "template_index.json", {});
audio_play_sound(snd_accendino_1, 20, false);
