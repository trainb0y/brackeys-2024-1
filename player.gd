extends CharacterBody2D

 
const SPEED: float = 250.0
const JUMP_VELOCITY: float = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = 700

## Jump mechanic
const JUMP_BUFFER_LENGTH: float = 0.08
const COYOTE_LENGTH: float = 0.08

var current_jump_buffer: float = 0
var current_coyote: float = 0
var current_air_time: float = 0

func _physics_process(delta: float):
	
	handle_jump(delta)	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("player_left", "player_right")
	if direction:
		var vel = direction * SPEED
		if is_on_floor():
			velocity.x = vel 
		else: 
			velocity.x = vel / 1.5	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func handle_jump(delta: float):
	current_jump_buffer -= delta
	current_coyote -= delta
	
	if is_on_floor():
		current_coyote = COYOTE_LENGTH
		current_air_time = 0
	else: 
		current_air_time += delta
		var mod = 1
		if current_air_time > 0.1:
			mod += log(current_air_time * 10)  
		
		# apply gravity 
		velocity.y += gravity * delta * mod
	
	
	if Input.is_action_just_pressed("player_jump"):
		current_jump_buffer = JUMP_BUFFER_LENGTH
	
	# new jump 	
	if current_coyote > 0 and current_jump_buffer > 0:
		velocity.y = JUMP_VELOCITY
		current_jump_buffer = -1;
		current_air_time = 0 # shhhh
	
