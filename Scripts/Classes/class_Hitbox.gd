extends Area2D
class_name Hitbox

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@export var damage_amount : float

signal hitbox_collide
signal hurtbox_collide
signal body_collide


func _ready() -> void:
	area_entered.connect(on_area2D_entered)
	body_entered.connect(on_body2D_entered)

func on_area2D_entered(area : Area2D):
	if area is Hitbox:
		hitbox_collide.emit()
	if area is Hurtbox:
		hurtbox_collide.emit()

func on_body2D_entered(_body : Node2D):
	body_collide.emit()
