extends CollisionShape2D

var texture1 = preload("res://2head2-removebg-preview.png")
var texture2 = preload("res://2head1-removebg-preview.png")
var bullet = preload("res://source/actors/playerbullet.tscn")
var shootdelay = 1.0
var delay=false
var flip=false

func _process(delta):
	if Input.is_action_just_pressed("left_click") and shootdelay ==1:
		delay=true
		var bullet_instance = bullet.instance()
		if flip==false:
			bullet_instance.position = get_parent().get_parent().get("position")+Vector2(10,-30)
		else:
			bullet_instance.position = get_parent().get_parent().get("position")+Vector2(-10,-30)
		bullet_instance.rotation_degrees = get("rotation")
		bullet_instance.apply_impulse(Vector2(),Vector2(1000,0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
	if shootdelay <=0:
		delay=false
		shootdelay = 1.0
	if delay==true:
		shootdelay-=delta

func _physics_process(delta):
	var mysprite = get_node("Head2-removebg-preview")
	var rotat = rad2deg(get("rotation"))
	look_at(get_global_mouse_position())
	if rotat > 360 or rotat < -360:
		set("rotation",0)
	if rotat > 90 and rotat < 270 or rotat < -90 and rotat > -270:
		mysprite.set_texture(texture2)
		flip=true
	else:
		mysprite.set_texture(texture1)
		flip=false
