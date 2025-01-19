extends CharacterBody2D

const DECELERATION = 2.0  # How quickly the character decelerates
const JOGGINGSPEED = 15.0  # Constant jogging speed (km/h)
const MAX_SPEED = 42.72  # Constant max running speed (km/h)
const MAX_ACCELERATION_SPEED = 40.0  # Rate of max acceleration change (m/s2)x0

const DRIBBLE_CONTROL = 0
const SHOOTING_CONTROL = 1
const PASSING_CONTROL = 2
const DASHING_CONTROL = 3

# Define abilities
var topSpeed = 32.0  # Top speed (km/h)
var acceleration = 9.0  # Rate of acceleration change (m/s2)
var shootingPower = 5000
var passingPower = 2500
var onBallSpeedMultiplier = 0.85
var dashingPowerMultiplier = 0.85
var tightPosession = 0.375

# Define controls
var moveLeft = "key_move_left"
var moveRight = "key_move_right"
var moveUp = "key_move_up"
var moveDown = "key_move_down"
var sprinting = "key_sprint"  # Key to activate sprinting
var shooting = "key_shoot"
var passing = "key_pass"

# Add new variables for charging mechanism
var shooting_charge_time = 0.0
var passing_charge_time = 0.0
const MAX_SHOOTING_CHARGE = 2.0  # Maximum charge time for shooting (seconds)
const MAX_PASSING_CHARGE = 2.0  # Maximum charge time for passing (seconds)

var action_time_limit = 0.5  # Time limit in seconds for how long an action stays 
var dash_time_limit = 1.5
var action_timer = 0.0       # Timer to track the duration of the current action

var onBall = false
var onSelect = false

#@export var rigid_body_path: NodePath
var ball: RigidBody2D

# Double-tap detection
var last_sprint_time = -1.0  # Last time the sprint button was pressed
var double_tap_window = 1.0  # Time window for double-tap detection (seconds)

var actionController = DRIBBLE_CONTROL

func control(delta):
	# Keyboard and controller input
	var input = Input.get_vector(moveLeft, moveRight, moveUp, moveDown).normalized()
	
	## Normalize combined input direction
	#if input.length() > 1:
		#input = input.normalized()

	# Determine the current speed
	var current_speed = JOGGINGSPEED
	if Input.is_action_pressed(sprinting):
		current_speed = topSpeed  # Sprinting speed
		if onBall:
			current_speed = current_speed * onBallSpeedMultiplier

	# Target velocity based on input
	var target_velocity = input * current_speed * 3

	if input != Vector2.ZERO:
		# Logarithmic acceleration
		var speed = velocity.length()
		var factor = acceleration / 5 * delta / (1 + (speed / current_speed))
		velocity = velocity.lerp(target_velocity, factor)
	else:
		# Decelerate
		velocity = velocity.lerp(Vector2.ZERO, DECELERATION * delta)
	
	# Move the character
	move_and_slide()
	
	# Handle shooting control
	if Input.is_action_just_pressed(shooting):
		actionController = SHOOTING_CONTROL
		action_timer = action_time_limit  # Reset the timer

	elif Input.is_action_just_pressed(passing):
		actionController = PASSING_CONTROL
		action_timer = action_time_limit  # Reset the timer

	# Handle dashing double-tap
	elif Input.is_action_just_pressed(sprinting):
		var current_time = Time.get_ticks_msec() / 1000.0  # Convert milliseconds to seconds
		if (current_time - last_sprint_time) <= double_tap_window:
			# Double-tap detected
			actionController = DASHING_CONTROL
			action_timer = dash_time_limit  # Reset the timer
		last_sprint_time = current_time
		
	# Applying dashing
	if onBall and actionController == DASHING_CONTROL:
		var ball_force = input * topSpeed * topSpeed # Different force for double-tap
		ball.apply_central_force(ball_force)
		actionController = DRIBBLE_CONTROL
		
	# Applying shooting
	elif onBall and actionController == SHOOTING_CONTROL:
		var ball_force = input * shootingPower
		ball.apply_central_force(ball_force)
		actionController = DRIBBLE_CONTROL
	
	# Applying passing
	elif onBall and actionController == PASSING_CONTROL:
		var ball_force = input * passingPower
		ball.apply_central_force(ball_force)
		actionController = DRIBBLE_CONTROL
		
	# Applying dribbling
	elif onBall and actionController == DRIBBLE_CONTROL:
		var ball_force = input * (current_speed * tightPosession) # Different force for double-tap
		ball.apply_central_force(ball_force)
		if ball.linear_velocity.length() < 20:
			ball_force = input * (velocity.length() - ball.linear_velocity.length())
			ball.apply_central_force(ball_force)
		actionController = DRIBBLE_CONTROL
	
	
func _on_area_2d_area_entered(area):
	if area.is_in_group("ball"):
		onBall = true

func _on_area_2d_area_exited(area):
	if area.is_in_group("ball"):
		onBall = false

func _ready():
	ball = get_parent().get_parent().get_node("ball")  # Correctly access the ball using the exported path

func _physics_process(delta):
	if onSelect:
		control(delta)
