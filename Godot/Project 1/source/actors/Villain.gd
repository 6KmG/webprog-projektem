extends Area2D

@onready var lookto = get_parent().get_node("Player")
var bullet = preload("res://source/actors/bullet.tscn")
var shootdelay = 1
var posdelay =0.5
var win = false
var hp = 15
var rng = RandomNumberGenerator.new()
var randommovement=rng.randf_range(-10,0)

func _process(delta):
	shootdelay-=delta
	posdelay-=delta
	position.x+=randommovement
	if shootdelay <=0:
		var bullet_instance = bullet.instantiate()
		bullet_instance.position = position
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(1000,0).rotated(rotation), Vector2())
		get_tree().get_root().add_child(bullet_instance)
		shootdelay = 1
	if hp ==0:
		win = true
		get_tree().change_scene_to_file("res://source/actors/victory scene.tscn")
	if posdelay<=0 and position.x<=get_viewport().size.x and position.x>=0:
		randommovement=rng.randf_range(-8.0, 8.0)
		posdelay = 0.5
	elif posdelay<=0 and position.x>=get_viewport().size.x:
		randommovement=rng.randf_range(-8.0,-2)
		posdelay = 0.5
	elif posdelay<=0 and position.x<=0:
		randommovement=rng.randf_range(2, 8.0)
		posdelay = 0.5
		
func _physics_process(delta):
	look_at(lookto.position)
	if rad_to_deg(get("rotation"))>90:
		get_node("Rickastley-removebg-preview").set_flip_v(true)
	elif rad_to_deg(get("rotation"))<90:
		get_node("Rickastley-removebg-preview").set_flip_v(false)

func _on_Area2D_body_entered(body):
	if body.is_in_group("playerbullet"):
		hp-=1
