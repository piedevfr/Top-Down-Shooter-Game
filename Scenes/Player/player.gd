class_name Player
extends CharacterBody2D

@onready var ammo: Label = $Ammo
@export var show_health : bool

var speed = 150.0
@export var gun : Gun

func _ready() -> void:
	position = Vector2(0,0)

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if show_health == true:
		ammo.visible = true
		ammo.text = "Ammo: %s" % gun.ammo
	elif show_health == false:
		ammo.visible = false
	
	move_and_slide()
