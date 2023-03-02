extends Control

var file = File.new()

func _ready():
	file.open("user://save_game.txt", File.WRITE_READ)
	file.store_string(to_json(Time.get_datetime_dict_from_system())+"\n")
	file.close()
