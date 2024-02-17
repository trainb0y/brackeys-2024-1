class_name Transition
extends CanvasLayer

@onready var rect := $ColorRect
@onready var anim := $AnimationPlayer
var player: Player = null

func _ready():
	rect.visible = true
	
func _process(delta):
	if player != null:
		var pos = player.get_global_transform_with_canvas().origin
		var cam: Camera2D = player.get_node("Camera2D")
		var size = get_viewport().size

		rect.material.set_shader_parameter("player_position", Vector2(pos.x / size.x, pos.y / size.y))
	

func into_black():
	anim.queue("out")

func out_of_black():
	anim.queue("in")
	
