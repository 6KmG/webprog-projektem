extends Player

# Initialize the player properties in _ready or _init
func _ready():
	init_player(26.0, 5.0, 5000, 0.5, 1.0, 55)

# Process function to handle player logic every frame
func _process(delta):
	handle_logic(delta)  # Call the shared logic function from the Player class
