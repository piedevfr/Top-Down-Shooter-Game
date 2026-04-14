class_name Gun
extends Node2D

@onready var nuzzle = $Nuzzle
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var shoot_timer: Timer = $shoot_timer

const BULLET := preload("res://Top-Down-Shooter-Game/Scenes/Bullet/bullet.tscn")

@export var ammo = 20:
	set(value):
		ammo = clamp(value, 0, 20)
@export var reload_time : float = 0.3
@export var fire_rate : float = 0.1

var can_shoot : bool = true
var can_reload : bool
var is_reloading : bool

func _ready() -> void:
	can_shoot = true
	can_reload = false

func _process(_delta: float) -> void:
	rotate_weapon()
	#timer.wait_time = fire_rate
	if Input.is_action_pressed("shoot") and ammo > 0 :
		if can_shoot == true:
			shoot()
	if Input.is_action_just_pressed("reload"):
		reload()

func rotate_weapon():
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and 270 > rotation_degrees:
		scale.y = -1
	else:
		scale.y = 1

func shoot():
	can_shoot = false
	can_reload = false
	is_reloading = false
	var bullet_instance = BULLET.instantiate()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.global_position = nuzzle.global_position
	bullet_instance.rotation = rotation
	ammo -= 1
	animation_player.play("gun_shoot")
	shoot_timer.start(fire_rate)

func reload():
	if ammo < 20:
		can_reload = true
	if can_reload == true and is_reloading == false:
		animation_player.play("reload")
		for i in 5:
			if ammo < 20:
				if can_reload == true:
					is_reloading = true
					ammo += 4
					await get_tree().create_timer(reload_time).timeout
		if can_reload == true:
			animation_player.play_backwards("reload")

func _on_shoot_timer_timeout() -> void:
	can_shoot = true
