extends Area2D

@onready var player = get_parent()

func _on_body_entered(body):
	player.die()
