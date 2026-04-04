extends Area2D

class_name Hurtbox


func _ready() -> void:
	area_entered.connect(_on_area_entered)



func _on_area_entered(area : Area2D):
	if area == Hitbox:
		take_damage(area)

func take_damage(hitbox : Hitbox):
	if hitbox == Hitbox:
		var d = 0
		d -= hitbox.damage_amount
