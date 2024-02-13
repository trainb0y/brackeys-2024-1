class_name Dimensions
extends Node

@export var first_dimension: Dimension

var current: Dimension = null
var dimensions: Array[Dimension] = []


func _ready():
	for dim in get_children():
		if not dim is Dimension: continue
		dim.disable()
		remove_child(dim)
		dimensions.append(dim)
		
	switch_to(first_dimension)

	

func switch_to(d: Dimension):
	if current != null:
		current.disable()
		remove_child(current)
	add_child(d)
	d.enable()
	current = d
	
