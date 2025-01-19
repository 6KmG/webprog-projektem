extends CharacterBody2D

class_name PlayerStruct

const BALL_PATH = "Node2D/ball"

const JOGGING_SPEED = 15.0
const MAX_SPEED = 42.72
const MAX_ACCELERATION_SPEED = 40.0

const PASSING_POWER = 2500
const ON_BALL_SPEED_MULTIPLIER = 0.85
const DASHING_POWER_MULTIPLIER = 0.85
const ACTION_TIME_LIMIT = 0.5  # Time limit in seconds for how long an action stays 
const DASH_TIME_LIMIT = 1.5

const DRIBBLE_CONTROL = 0
const SHOOTING_CONTROL = 1
const PASSING_CONTROL = 2
const DASHING_CONTROL = 3

# Define controls
const MOVE_LEFT = "key_move_left"
const MOVE_RIGHT = "key_move_right"
const MOVE_UP = "key_move_up"
const MOVE_DOWN = "key_move_down"
const SPRINTING = "key_sprint"
const SHOOTING = "key_shoot"
const PASSING = "key_pass"

# Define abilities
var topSpeed
var acceleration
var shootingPower
var tightPosession
var deceleration

# Double-tap detection
var lastSprintTime = -1.0
const DOUBLE_TAP_WINDOW = 1.0

var actionController = DRIBBLE_CONTROL
var ball: RigidBody2D
var onBall = false
var onSelect
var actionTimer = 0.0       # Timer to track the duration of the current action

var input: Vector2 = Vector2.ZERO
var currentSpeed = 0
var targetVelocity
