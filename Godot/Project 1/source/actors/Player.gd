extends CharacterBody2D

var velo = Vector2(0,0)
var speed=300
var gravity=1800
var jump=-600
@onready var animatedSprite = $Body/AnimatedSprite2D

func _physics_process(delta):
	#Move left
	if Input.is_action_pressed("key_a"):
		velo.x=-speed
	#Move right
	if Input.is_action_pressed("key_d"):
		velo.x=speed
	#Jump
	if Input.is_action_just_pressed("spacebar") and is_on_floor():
		velo.y=jump
	#Moving animation
	if velo.x>100:
		animatedSprite.play("run")
		animatedSprite.set_flip_h(false)
	elif velocity.x<-100:
		animatedSprite.play("run")
		animatedSprite.set_flip_h(true)
	else:
		animatedSprite.stop()
	#Fall
	if velo.y<-jump:
		velo.y+=gravity*delta

	set_velocity(velo)
	set_up_direction(Vector2.UP)
	set_floor_stop_on_slope_enabled(true)
	move_and_slide()
	velo.x=lerp(velo.x,0.0,0.4)

func _on_fallout_body_entered(body):
	if body==self:
		get_tree().change_scene_to_file("res://source/actors/lose scene.tscn")
