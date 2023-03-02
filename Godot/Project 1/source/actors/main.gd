extends Node2D

onready var gameover = $Player
onready var background = $TextureRect

func _process(delta):
	if gameover.gameover==true:
		background.texture = load("res://background_lose.png")
		get_tree().paused = true
