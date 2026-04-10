extends Node2D

const BULLET_SPEED = 1000
@onready var hitbox: Hitbox = $Hitbox

func _ready() -> void:
	hitbox.body_collide.connect(on_body_collide)
	


func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * BULLET_SPEED * delta

func on_body_collide():
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
