class_name Gun
extends Node2D

@onready var nuzzle = $Nuzzle
const BULLET := preload("res://Top-Down-Shooter-Game/Scenes/Bullet/bullet.tscn")
@export var ammo = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous fram
func _process(delta: float) -> void:
	rotate_weapon()
	if Input.is_action_just_pressed("shoot") and ammo > 0 :
		var bullet_instance = BULLET.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = nuzzle.global_position
		bullet_instance.rotation = rotation
		ammo -= 1
	if Input.is_action_just_pressed("reload"):
		ammo = 20
		

func rotate_weapon():
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and 270 > rotation_degrees:
		scale.y = -1
	else:
		scale.y = 1
