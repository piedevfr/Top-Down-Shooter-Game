extends Area2D
class_name Hitbox

@export var damage_amount : int = 10
@export var free_on_collision : bool = true

signal hitbox_collided #provides the body collided with.(body : Node2D)

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	if free_on_collision == true:
		hitbox_collided.connect(_on_hitbox_collided)

func _on_body_entered(body : Node2D):
	hitbox_collided.emit(body)

func _on_hitbox_collided(_body : Node2D):
	var parent = get_parent()
	parent.queue_free()
