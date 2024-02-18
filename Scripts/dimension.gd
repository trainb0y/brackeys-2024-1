class_name Dimension
extends TileMap

@export var color: Color
@export var spawn_point: Vector2

@onready var player: Player = Util.get_player()

func disable():
	pass
	
func enable():
	player.spawn_point = spawn_point
	self_modulate = color

