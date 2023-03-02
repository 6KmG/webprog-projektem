extends KinematicBody2D

var velocity = Vector2(0,0)
var speed=300
var gravity=1800
var jump=-600
onready var animatedSprite = $Body/AnimatedSprite

func _physics_process(delta):
	#Move left
	if Input.is_action_pressed("key_a"):
		velocity.x=-speed
	#Move right
	if Input.is_action_pressed("key_d"):
		velocity.x=speed
	#Jump
	if Input.is_action_just_pressed("spacebar") and is_on_floor():
		velocity.y=jump
	#Moving animation
	if velocity.x>100:
		animatedSprite.play("run")
		animatedSprite.set_flip_h(false)
	elif velocity.x<-100:
		animatedSprite.play("run")
		animatedSprite.set_flip_h(true)
	else:
		animatedSprite.stop()
	#Fall
	if velocity.y<-jump:
		velocity.y+=gravity*delta

	move_and_slide(velocity,Vector2.UP,true)
	velocity.x=lerp(velocity.x,0,0.4)

func _on_fallout_body_entered(body):
	if body==self:
		get_tree().change_scene("res://source/actors/lose scene.tscn")
