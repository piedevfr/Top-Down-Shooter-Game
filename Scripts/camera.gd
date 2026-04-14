extends Camera2D

@onready var player: Player = $"../Player"

func _process(delta: float) -> void:
	position = player.position.lerp(get_global_mouse_position(), 1.0/12.0)
