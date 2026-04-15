extends Node2D

@onready var directional_light_2d: DirectionalLight2D = $DirectionalLight2D

const SPEED = 800

func _ready() -> void:
	#directional_light_2d.enabled = true
	pass

func _process(delta: float) -> void:
	position += transform.x * SPEED * delta
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func bullet_flash():
	directional_light_2d.enabled = true
	await get_tree().create_timer(0.001/2).timeout
	directional_light_2d.queue_free()
