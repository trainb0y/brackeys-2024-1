extends Area2D

@onready var player: Player = get_parent()

func _on_body_entered(body: Node2D):
	if body is Player: return
	print("DEATH! " + body.name)
	player.die()
