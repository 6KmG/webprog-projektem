extends ProgressBar

# Set up the ProgressBar
func _ready():
	self.max_value = 0.7
	self.value = 0

# Change the Power Value with Tweening
func change_power(value: float, speed: float):
	create_tween().tween_property(self, "value", value, speed)
