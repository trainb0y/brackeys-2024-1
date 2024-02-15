class_name Dimension
extends TileMap

@export var color: Color

func disable():
	pass
	
func enable():
	self_modulate = color

