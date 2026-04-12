extends Node2D
class_name Bullet


@export var SPEED = 1500
@onready var hitbox : Hitbox


func _process(delta: float) -> void:
	position += transform.x * SPEED * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
