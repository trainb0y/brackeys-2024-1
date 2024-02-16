class_name Dialog
extends Area2D

@export_multiline var text: String
@onready var label: RichTextLabel = $Label

const speed = 0.05

var typing = false
var cooldown: float = 0 

func _ready():
	label.text = text
	label.visible_characters = 0

func _process(delta):
	if not typing: return
	cooldown -= delta
	if cooldown < 0:
		label.visible_characters += 1
		cooldown += speed
		

func _on_body_entered(body: Node2D):
	if body is Player:
		typing = true
