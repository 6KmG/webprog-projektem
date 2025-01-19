extends Node2D

# Constants
const SELECT_PLAYER = "key_switch_player"
const BALL_PATH = "Node2D/ball"
const NUM_OF_SELECTED = 2

# Variables
var players: Array[CharacterBody2D] = []
var player_nodes: Array[NodePath] = []
var ball: RigidBody2D
var selection_index: int = 0

# Sort Players by Distance to Ball
func sort_by_distance_to_ball(player1: Player, player2: Player) -> bool:
	ball = get_tree().get_root().get_node(BALL_PATH)
	return player1.global_position.distance_to(ball.global_position) < player2.global_position.distance_to(ball.global_position)

# Select a Player
func select_player():
	selection_index = (selection_index + 1) % NUM_OF_SELECTED
	for player in players:
		player.is_action_gauge_active = false
		player.is_selected = false
	players[selection_index].is_selected = true
	print("selected")

# Initialize the Team
func _ready():
	for child in get_children():
		if child is CharacterBody2D:
			players.append(child)
			player_nodes.append(child.get_path())
	players[0].is_selected = true
	ball = get_tree().get_root().get_node(BALL_PATH)

# Process Team Logic Each Frame
func _process(delta):
	players.sort_custom(sort_by_distance_to_ball)
	
	if Input.is_action_just_pressed(SELECT_PLAYER) or players[selection_index].action_done:
		select_player()
