extends Area2D

@export_file(".tscn") var next_level: String
@export_file(".tscn") var current_level: String

@onready var t: Transition = Util.get_transition()
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready():
	owner.connect("ready", _on_scene_ready)
	
func _on_scene_ready():
	t.out_of_black()

func _on_body_entered(body):
	if body is Player:
		t.into_black()
		audio.play()
		await get_tree().create_timer(0.4).timeout
		get_tree().change_scene_to_file(next_level)
		