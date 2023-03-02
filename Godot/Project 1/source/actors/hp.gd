extends Label

func _process(delta):
	self.text = str(get_parent().get_node("Villain").hp)
