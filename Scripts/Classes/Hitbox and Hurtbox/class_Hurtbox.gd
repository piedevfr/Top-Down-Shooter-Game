extends Area2D
class_name Hurtbox

signal hurtbox_entered #supplies "hitbox: Hitbox" as an argument
signal hurtbox_exited #supplies "hitbox: Hitbox" as an argument

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _on_area_entered(body : Node2D):
	if body is Hitbox:
		hurtbox_entered.emit(body, body.damage_amount)

func _on_area_exited(body : Node2D):
	if body is Hitbox:
		hurtbox_exited.emit(body, body.damage_amount)
