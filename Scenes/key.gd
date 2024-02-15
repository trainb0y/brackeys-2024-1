class_name Key
extends CharacterBody2D

@export var spawn_point: Node2D
@export var unlocks: Door

const follow_distance: float = 150
const near_distance: float = 20
const speed: float = 150

var target: Player = null

func _ready():
	position = spawn_point.position
	print(unlocks.target.color)
	modulate = unlocks.target.color


func _physics_process(delta):
	if target == null: return
	if target.position.distance_squared_to(position) > follow_distance * follow_distance: 
		target = null
		return
	
	var dir = (target.position - position).normalized()
	
	if target.position.distance_squared_to(position) < near_distance * near_distance:
		velocity = velocity.move_toward(Vector2.ZERO, delta * 1000)
	else:
		velocity = dir * speed
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D):
	if body is Player: target = body as Player



func _on_player_detector_area_entered(area):
	if unlocks == area and (area as Door).locked:
		area.unlock()
		queue_free()
