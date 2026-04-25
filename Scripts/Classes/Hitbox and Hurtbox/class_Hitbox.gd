extends Area2D
class_name Hitbox

@export var damage_amount : int = 10:
	set(value):
		damage_amount = value
		update_configuration_warnings()

@export var free_on_collision : bool = true
var parent_hurtbox : Hurtbox

signal hitbox_collided(body : Node2D) #provides the body collided with.(body : Node2D)

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	if free_on_collision == true:
		hitbox_collided.connect(_on_hitbox_collided)
	parent_hurtbox = get_parent_hurtbox()


func _on_area_entered(body : Node2D):
	hitbox_collided.emit(body)

func _on_hitbox_collided(_body : Node2D):
	var parent = get_parent()
	parent.queue_free()

func get_parent_hurtbox():
	for child in get_parent().get_children():
		if child is Hurtbox:
			return child
		else:
			return null

func _get_configuration_warnings() -> PackedStringArray:
	if parent_hurtbox:
		return ["If the parent has hurtbox, 
				damage_amount must be 0,
			or else the parent will take damage if it has a damage script"]
	else:
		return []
