extends CharacterBody2D


var speed = 120.0
@export var gun : Node2D

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	rotate_weapon(gun)
	
	move_and_slide()

func rotate_weapon(weapon : Node2D):
	var mouse_pos = get_global_mouse_position()
	weapon.look_at(mouse_pos)
