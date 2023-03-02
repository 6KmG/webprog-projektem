extends KinematicBody

var velocity = Vector3(0,0,0)
var camera_y = 0
var camera_x = 0

func _input(event):
	if event is InputEventMouseMotion:
		camera_x -= event.relative.x/2
		camera_y -= event.relative.y/2

func _process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if Input.is_action_pressed("Key_W"):
		Vector3.FORWARD
	elif Input.is_action_pressed("Key_A"):
		velocity.x = 10
	elif Input.is_action_pressed("Key_D"):
		velocity.x = -10
	elif Input.is_action_pressed("Key_S"):
		velocity.z = sign(rotation_degrees.y)*-10

	else:
		velocity = Vector3(0,0,0)
	print(sign(rotation_degrees.y)*-10)
	rotation_degrees.y = camera_x
	if camera_y < 90 and camera_y > -90:
		$Eyes.rotation_degrees.x = camera_y
	move_and_slide(velocity)
