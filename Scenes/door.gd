class_name Door
extends Area2D

@export var target: Dimension
@onready var dimensions: Dimensions = get_parent().get_parent()
@onready var player: AudioStreamPlayer2D = $AudioStreamPlayer2D

@onready var sound_open: AudioStream = preload("res://Sounds/door_open.wav")
@onready var sound_unlock: AudioStream = preload("res://Sounds/door_unlock.wav")
@onready var sound_fail: AudioStream = preload("res://Sounds/door_locked.wav")

var locked = true

func _ready():
	modulate = target.color

func _input(event: InputEvent):
	if Input.is_action_just_pressed("player_use"):
		for body in get_overlapping_bodies():
			if body is Player:
				try_use()

func try_use():				
	if not locked:
		player.stop()
		player.stream = sound_open
		player.play()
		dimensions.switch_to(target)
	else:
		player.stop()
		player.stream = sound_fail 
		player.play()
		


func unlock():
	player.stop()
	player.stream = sound_unlock
	player.play()
	locked = false
