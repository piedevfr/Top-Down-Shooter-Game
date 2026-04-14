class_name Player
extends CharacterBody2D

@onready var ammo: Label = $Ammo
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var show_ammo : bool
@export var gun : Gun

var speed = 150.0

func _ready() -> void:
	position = Vector2(0,0)

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if show_ammo == true:
		ammo.visible = true
		ammo.text = "Ammo: %s" % gun.ammo
	elif show_ammo == false:
		ammo.visible = false
	rotate_sprite()
	
	move_and_slide()

func rotate_sprite():
	var mouse_pos = get_global_mouse_position()
	if mouse_pos.x < global_position.x:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false
