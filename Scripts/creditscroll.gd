extends Control

@onready var label: RichTextLabel = $RichTextLabel
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

const speed = 0.06

var typing = false
var cooldown: float = 0 

func _ready():
	label.visible_characters = 0
	audio.play()

func _process(delta):
	cooldown -= delta
	if cooldown < 0:
		label.visible_characters += 1
		cooldown += speed
	
	if label.visible_ratio >= 1:
		audio.stop()

func _on_audio_stream_player_2d_finished():
	audio.play()
