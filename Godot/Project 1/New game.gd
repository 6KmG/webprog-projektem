extends Button

func _on_New_game_pressed():
	get_tree().change_scene_to_file("res://source/actors/Player.tscn")
