class_name Key
extends CharacterBody2D

@export var unlocks: Door

const follow_distance: float = 150
const near_distance: float = 20
const speed: float = 150

var target: Player = null
var offset: Vector2 = Vector2.ZERO
var t_dir = 1

var spawn_point: Vector2

func _ready():
	spawn_point = position
	modulate = unlocks.target.color

func _physics_process(delta: float):
	if target == null: 
		# budget tweening
		position -= offset
		offset = offset + Vector2(0, delta * t_dir * 10)
		if abs(offset.y) > 5:
			t_dir = -t_dir
		position += offset
		return
	if target.position.distance_squared_to(position) > follow_distance * follow_distance: 
		target = null
		return
	
	var dir := (target.position - position).normalized()
	
	if target.position.distance_squared_to(position) < near_distance * near_distance:
		velocity = velocity.move_toward(Vector2.ZERO, delta * 1000)
	else:
		velocity = dir * speed
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D):
	if body is Player: target = body as Player



func _on_player_detector_area_entered(area: Area2D):
	if unlocks == area and (area as Door).locked:
		(area as Door).unlock()
		queue_free()
