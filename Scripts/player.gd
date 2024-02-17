class_name Player
extends CharacterBody2D

@export var spawn_point: Node2D
@export var death_y: float = 1000
 
const SPEED: float = 250.0
const JUMP_VELOCITY: float = -300.0
var GRAVITY: float = 700

const JUMP_BUFFER_LENGTH: float = 0.08
const COYOTE_LENGTH: float = 0.08

var current_jump_buffer: float = 0
var current_coyote: float = 0
var current_air_time: float = 0

@onready var t: Transition = get_parent().get_node("Transition")

func _ready():
	position = spawn_point.position
	t.player = self

func _physics_process(delta: float):
	handle_gravity(delta)
	handle_jump(delta)	
	handle_movement(delta)
	
	move_and_slide()
	
	if position.y > death_y: die()

func handle_movement(delta: float):	
	var direction := Input.get_axis("player_left", "player_right")
	if direction:
		var vel := direction * SPEED
		if is_on_floor():
			velocity.x = vel 
		else: 
			velocity.x = vel / 1.5
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func handle_gravity(delta: float):
	if not is_on_floor():
		if current_air_time > 0.1:
			velocity.y += GRAVITY * delta * (1 + log(current_air_time * 10))
		else:
			velocity.y += GRAVITY * delta
	
	
func handle_jump(delta: float):
	current_jump_buffer -= delta
	current_coyote -= delta
	
	if is_on_floor():
		current_coyote = COYOTE_LENGTH
		current_air_time = 0
	else: 
		current_air_time += delta
	
	if Input.is_action_just_pressed("player_jump"):
		current_jump_buffer = JUMP_BUFFER_LENGTH
	
	# new jump 	
	if current_coyote > 0 and current_jump_buffer > 0:
		velocity.y = JUMP_VELOCITY
		current_jump_buffer = -1;
		current_air_time = 0 # shhhh

var dying := false
func die():
	if dying: return
	dying = true
	t.into_black()
	await get_tree().create_timer(0.4).timeout
	position = spawn_point.position
	t.out_of_black()
	dying = false