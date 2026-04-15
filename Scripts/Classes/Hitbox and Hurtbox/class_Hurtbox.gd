extends Area2D
class_name Hurtbox

signal hurtbox_entered #supplies "hitbox: Hitbox" as an argument
signal hurtbox_exited #supplies "hitbox: Hitbox" as an argument

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body : Node2D):
	if body is Hitbox:
		hurtbox_entered.emit(body)

func _on_body_exited(body : Node2D):
	if body is Hitbox:
		hurtbox_exited.emit(body)
