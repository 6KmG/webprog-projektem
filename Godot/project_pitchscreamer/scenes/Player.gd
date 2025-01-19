## Ideas
## Progressbar for shooting and passing
# Stamina
# Curling ability (measured in degree)
# MultiPlayer:
# Attacking tactics: 	- players move quickly on gaining posession
#						- players organize in triangles and wiggling around
#						etc.
# Defensive tactics:	- all out defense
#						- tight marking every player
# 						etc.

extends CharacterBody2D

class_name Player

# Constants
const BALL_PATH = "Node2D/ball"

const PASSING_POWER = 3000
const ON_BALL_SPEED_MULTIPLIER = 0.85
const DASHING_POWER_MULTIPLIER = 0.75
const PLAYER_SPEED_MULTIPLIER = 1.1
const PLAYER_ACCELERATION_MULTIPLIER = 4
const ACTION_TIME_LIMIT = 0.5  # Seconds
const DASH_TIME_LIMIT = 1.5
const ACTION_TIMER_LIMIT = 1.5
const MIN_ACTION_POWER = 0.4

const JOGGING_SPEED = 15.0 * PLAYER_SPEED_MULTIPLIER
const MAX_SPEED = 44.44  # km/h
const MAX_ACCELERATION_SPEED = 10.0

# Control Modes
enum ControlMode {
	DRIBBLE,
	SHOOTING,
	PASSING,
	DASHING
}

# Input Actions
const INPUT_ACTIONS = {
	"MOVE_LEFT": "key_move_left",
	"MOVE_RIGHT": "key_move_right",
	"MOVE_UP": "key_move_up",
	"MOVE_DOWN": "key_move_down",
	"SPRINTING": "key_sprint",
	"SHOOTING": "key_shoot",
	"PASSING": "key_pass"
}

# Variables
var top_speed: float
var acceleration: float
var shooting_power: float
var tight_possession: float
var deceleration: float
var stamina: float

var last_sprint_time: float = -1.0
const DOUBLE_TAP_WINDOW: float = 1.0

var action_mode: ControlMode = ControlMode.DRIBBLE
var on_ball: bool = false
var is_selected: bool = false
var action_timer: float = 0.0
var action_done: bool = false
var input: Vector2 = Vector2.ZERO
var current_speed: float = 0
var target_velocity: Vector2
var action_power_timer: float = 0.0
var is_action_gauge_active: bool = false
var action_power_timer_end: float = 0.0

var ball: RigidBody2D
var power_bar: ProgressBar

# Signals
signal action_performed(action_type: int)

# Initialize Player Properties
func init_player(_top_speed, _acceleration, _shooting_power, _tight_possession, _deceleration, _stamina):
	top_speed = _top_speed * PLAYER_SPEED_MULTIPLIER
	acceleration = _acceleration * PLAYER_ACCELERATION_MULTIPLIER
	shooting_power = _shooting_power
	tight_possession = _tight_possession
	deceleration = _deceleration
	stamina = _stamina
	is_selected = false
	
	ball = get_tree().get_root().get_node(BALL_PATH)
	power_bar = get_node("power_bar")

# Player Motion Handling
func handle_motion(delta):
	action_done = false
	
	input = Input.get_vector(INPUT_ACTIONS["MOVE_LEFT"], INPUT_ACTIONS["MOVE_RIGHT"], INPUT_ACTIONS["MOVE_UP"], INPUT_ACTIONS["MOVE_DOWN"]).normalized()
	current_speed = calculate_speed()

	if Input.is_action_just_pressed(INPUT_ACTIONS["SHOOTING"]) or Input.is_action_just_pressed(INPUT_ACTIONS["PASSING"]):
		start_action_gauge()

	if Input.is_action_just_released(INPUT_ACTIONS["SHOOTING"]):
		perform_action(ControlMode.SHOOTING)

	elif Input.is_action_just_released(INPUT_ACTIONS["PASSING"]):
		perform_action(ControlMode.PASSING)
	
	if Input.is_action_just_pressed(INPUT_ACTIONS["SPRINTING"]):
		handle_dashing()

	update_action_timer(delta)
	apply_action_to_ball()

# Calculate Speed Based on Input and Ball Control
func calculate_speed() -> float:
	var speed = JOGGING_SPEED
	if Input.is_action_pressed(INPUT_ACTIONS["SPRINTING"]):
		speed = top_speed
		if on_ball:
			speed *= ON_BALL_SPEED_MULTIPLIER
	return speed

# Start Action Gauge for Shooting or Passing
func start_action_gauge():
	action_power_timer = Time.get_unix_time_from_system()
	is_action_gauge_active = true

# Handle Double-Tap for Dashing
func handle_dashing():
	var current_time = Time.get_ticks_msec() / 1000.0
	if (current_time - last_sprint_time) <= DOUBLE_TAP_WINDOW:
		action_mode = ControlMode.DASHING
		action_timer = DASH_TIME_LIMIT
	last_sprint_time = current_time

# Perform Action (Shooting or Passing)
func perform_action(mode: ControlMode):
	action_power_timer_end = Time.get_unix_time_from_system()
	action_mode = mode
	action_timer = ACTION_TIME_LIMIT
	is_action_gauge_active = false  # Stop the gauge when the action is performed

# Update Action Timer and Handle Action Completion
func update_action_timer(delta):
	if action_timer > 0:
		action_timer -= delta
		if action_timer <= 0:
			reset_action()

# Reset Action to Default Mode
func reset_action():
	action_mode = ControlMode.DRIBBLE
	is_action_gauge_active = false

# Apply Actions Based on Control Mode
func apply_action_to_ball():
	if on_ball:
		match action_mode:
			ControlMode.DRIBBLE:
				apply_dribble_force()
			ControlMode.DASHING:
				apply_dashing_force()
			ControlMode.SHOOTING:
				apply_shooting_force()
			ControlMode.PASSING:
				apply_passing_force()

# Apply Dribble Force to Ball
func apply_dribble_force():
	if ball:
		var ball_force = input * (current_speed * tight_possession)
		ball.apply_central_force(ball_force)

		if ball.linear_velocity.length() < 20:
			ball_force = input * (velocity.length() - ball.linear_velocity.length())
			ball.apply_central_force(ball_force)

# Apply Dashing Force to Ball
func apply_dashing_force():
	if ball:
		var ball_force = input * top_speed * top_speed * DASHING_POWER_MULTIPLIER
		ball.apply_central_force(ball_force)
		reset_action()

# Apply Shooting Force to Ball
func apply_shooting_force():
	if ball:
		var power_factor = calculate_action_power_factor()
		var ball_force = input * shooting_power * power_factor
		ball.apply_central_force(ball_force)
		reset_action()

# Apply Passing Force to Ball
func apply_passing_force():
	if ball:
		var power_factor = calculate_action_power_factor()
		var ball_force = input * PASSING_POWER * power_factor
		ball.apply_central_force(ball_force)
		action_done = true
		reset_action()

# Calculate Action Power Factor Based on Timer
func calculate_action_power_factor() -> float:
	return fmod((Time.get_unix_time_from_system() - action_power_timer), ACTION_TIMER_LIMIT) + MIN_ACTION_POWER

# Handle Player Logic Each Frame
func handle_logic(delta):
	if is_selected:
		handle_motion(delta)
	else:
		input = Vector2.ZERO
		
	update_velocity(delta)
	update_power_bar(delta)
	move_and_slide()

# Update Player Velocity
func update_velocity(delta):
	target_velocity = input * current_speed * 3
	if input != Vector2.ZERO:
		var speed = velocity.length()
		var factor = acceleration / 5 * delta / (1 + (speed / current_speed))
		velocity = velocity.lerp(target_velocity, factor)
	else:
		velocity = velocity.lerp(Vector2.ZERO, deceleration * delta)

# Update Power Bar Based on Action Gauge
func update_power_bar(delta):
	if is_action_gauge_active:
		var current_power = calculate_action_power_factor()
		power_bar.change_power(current_power, 0.1)
	else:
		power_bar.change_power(0, 0)

# Ball Interaction Handling
func _on_area_2d_area_entered(area):
	if area.is_in_group("ball"):
		on_ball = true

func _on_area_2d_area_exited(area):
	if area.is_in_group("ball"):
		on_ball = false
