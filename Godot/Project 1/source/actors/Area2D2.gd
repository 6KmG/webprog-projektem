extends Area2D

onready var lookto = get_parent().get_node("Player")


func _physics_process(delta):
	look_at(lookto.position)
	if rad2deg(get("rotation"))>90:
		get_node("Rickastley-removebg-preview").set_flip_v(true)
	elif rad2deg(get("rotation"))<90:
		get_node("Rickastley-removebg-preview").set_flip_v(false)
