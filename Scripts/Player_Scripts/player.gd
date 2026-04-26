class_name Player
extends CharacterBody2D

@onready var ammo: Label = $Ammo
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var joystick = $CanvasLayer/Joystick

@export var show_ammo : bool
@export var mobile : bool
@export var gun : Node2D
@export var health : int = 100

var speed = 150.0
var direction

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	if mobile == false:
		direction = Input.get_vector("left", "right", "up", "down")
		joystick.visible = false
	elif mobile == true:
		direction = joystick.posVector
		joystick.visible = true
	velocity = direction * speed
	
	if show_ammo == true:
		ammo.visible = true
		ammo.text = "Ammo: %s" % gun.ammo
	elif show_ammo == false:
		ammo.visible = false
	
	if health <= 0:
		die()
	
	rotate_sprite()
	move_and_slide()

func rotate_sprite():
	var mouse_pos = get_global_mouse_position()
	if mouse_pos.x < global_position.x:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false

func die():
	queue_free()

func _on_hurtbox_entered(body: Hitbox, damage_amount: int) -> void:
	health -= damage_amount
