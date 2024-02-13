extends Area2D

@export var target: Dimension
@onready var dimensions: Dimensions = get_parent().get_parent()

func _input(event: InputEvent):
	if Input.is_action_just_pressed("player_use"):
		for body in get_overlapping_bodies():
			if body is Player:
				dimensions.switch_to(target)


