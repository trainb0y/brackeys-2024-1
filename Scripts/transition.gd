class_name Transition
extends CanvasLayer

@onready var rect := $ColorRect
@onready var anim := $AnimationPlayer
@onready var player: Player = Util.get_player()

# honestly this thing could probably be an autoload
# but... I'm lazy, and this is the last jam day
# so this works:tm:

func _ready():
	rect.visible = true
	out_of_black()
	
func _process(delta):
	if player == null: return
	
	var pos = player.get_global_transform_with_canvas().origin
	var cam: Camera2D = player.get_node("Camera2D")
	var size = get_viewport().size

	rect.material.set_shader_parameter(
		"player_position", 
		Vector2(pos.x / size.x, pos.y / size.y)
	)
	

func into_black():
	# :sparkles: useless :sparkles:
	anim.queue("out")

func out_of_black():
	anim.queue("in")
	
