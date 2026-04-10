extends Area2D
class_name Hurtbox

signal hitbox_entered
signal hitbox_exited

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body : Node2D):
	if body is Hitbox:
		hitbox_entered.emit(body)

func _on_body_exited(body : Node2D):
	if body is Hitbox:
		hitbox_exited.emit(body)
