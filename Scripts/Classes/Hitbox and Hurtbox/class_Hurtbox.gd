extends Area2D
class_name Hurtbox

var parent

signal hurtbox_entered(body : Hitbox, damage_amount : int) #supplies "hitbox: Hitbox" as an argument
signal hurtbox_exited(body : Hitbox, damage_amount : int) #supplies "hitbox: Hitbox" as an argument

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _on_area_entered(body : Node2D):
	if body is Hitbox:
		if !is_ancestor_of(body):
			hurtbox_entered.emit(body, body.damage_amount)

func _on_area_exited(body : Node2D):
	if body is Hitbox:
		if body.owner != owner:
			hurtbox_exited.emit(body, body.damage_amount)
			print(owner, body.owner)
