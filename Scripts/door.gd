class_name Door
extends Area2D

@export var target: Dimension
@export var locked = false

@onready var dimensions: Dimensions = get_parent().get_parent()
@onready var player: AudioStreamPlayer2D = $AudioStreamPlayer2D

@onready var sound_open: AudioStream = preload("res://Sounds/door_open.wav")
@onready var sound_unlock: AudioStream = preload("res://Sounds/door_unlock.wav")
@onready var sound_fail: AudioStream = preload("res://Sounds/door_locked.wav")

@onready var tex_locked: Texture = preload("res://Sprites/door-locked.png")
@onready var tex_unlocked: Texture = preload("res://Sprites/door.png")
@onready var tex_open: Texture = preload("res://Sprites/door-open.png")

@onready var transition: Transition = Util.get_transition()
@onready var sprite: Sprite2D = $Sprite2D

func _ready():
	modulate = target.color
	if locked:
		sprite.texture = tex_locked
	else:
		sprite.texture = tex_unlocked

func _input(event: InputEvent):
	if Input.is_action_just_pressed("player_use"):
		for body in get_overlapping_bodies():
			if body is Player:
				try_use()

func try_use():				
	if not locked:
		player.stream = sound_open
		player.play()
		sprite.texture = tex_open
		transition.into_black()
		await get_tree().create_timer(0.4).timeout
		dimensions.switch_to(target)
		sprite.texture = tex_unlocked
		transition.out_of_black()
	else:
		player.stream = sound_fail 
		player.play()
		


func unlock():
	player.stream = sound_unlock
	player.play()
	sprite.texture = tex_unlocked
	locked = false
