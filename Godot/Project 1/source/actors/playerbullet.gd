extends RigidBody2D

var timer = 5

func _on_RigidBody2D_body_entered(body):
	if body.is_in_group("platform"):
		queue_free()

func _process(delta):
	timer-=delta
	if timer<=0:
		queue_free()
		timer=5
