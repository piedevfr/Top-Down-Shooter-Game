extends Node2D

const BULLET_SPEED = 1000
@onready var gun_hitbox: Area2D = $Gun_Hitbox

func _ready() -> void:
	gun_hitbox.body_entered.connect(hit)
	


func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * BULLET_SPEED * delta

func hit():
	queue_free()
