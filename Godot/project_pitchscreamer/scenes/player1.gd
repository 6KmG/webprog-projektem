extends Player

# Initialize the player properties in _ready
func _ready():
	# Initialize player properties: topSpeed, acceleration, shootingPower, tightPossession, deceleration
	init_player(37.44, 5.0, 7000, 0.75, 1.0, 95)

# Process function to handle player logic every frame
func _process(delta):
	handle_logic(delta)  # Call the shared logic function from the Player class
