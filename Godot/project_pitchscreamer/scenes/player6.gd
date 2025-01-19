extends Player

# Initialize the player properties in _ready or _init
func _ready():
	init_player(32.0, 9.0, 5000, 0.5, 1.0, 89)

# Process function to handle player logic every frame
func _process(delta):
	handle_logic(delta)  # Call the shared logic function from the Player class
