class_name Transition
extends CanvasLayer

@onready var rect := $ColorRect
@onready var player := $AnimationPlayer

func _ready():
	rect.visible = true

func into_black():
	print("in!")
	player.queue("out")

func out_of_black():
	print("out!")
	player.queue("in")
	
