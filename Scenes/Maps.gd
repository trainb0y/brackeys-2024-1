extends Node

@onready var map: TileMap = $TileMap

func _process(delta): 
	map.modulate = map.modulate.lerp(Color(0.2, 0.2, 0.8, 1.0), delta / 4)
