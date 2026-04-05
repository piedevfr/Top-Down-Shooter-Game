class_name Player
extends CharacterBody2D

@onready var ammo: Label = $Ammo

var speed = 150.0
@export var gun : Gun

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	ammo.text = "Ammo: %s" % gun.ammo
	
	move_and_slide()
