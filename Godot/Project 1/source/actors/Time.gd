extends Label

var time = 0.0

func _process(delta):
	time+=delta
	self.text="%.2f"%(time)
