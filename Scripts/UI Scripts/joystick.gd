extends Sprite2D

@onready var parent : Node2D = $".."

var pressing : bool = false
var max_distance = 16
var deadzone = 5
var return_speed = 20


func _ready() -> void:
	max_distance *= parent.scale.x

func _process(delta: float) -> void:
	if pressing == true:
		if max_distance >= get_global_mouse_position().distance_to(parent.global_position):
			global_position = get_global_mouse_position()
		else:
			var angle = parent.global_position.angle_to_point(get_global_mouse_position())
			global_position.x = parent.global_position.x + cos(angle) * max_distance
			global_position.y = parent.global_position.y + sin(angle) * max_distance
		calculateVector()
	else:
		global_position = lerp(global_position, parent.global_position, return_speed * delta)
		parent.posVector = Vector2(0, 0)


func _on_button_button_down() -> void:
	pressing = true

func _on_button_button_up() -> void:
	pressing = false

func calculateVector():
	if abs(global_position.x - parent.global_position.x) >= deadzone:
		parent.posVector.x = (global_position.x - parent.global_position.x) / max_distance
	if abs(global_position.y - parent.global_position.y) >= deadzone:
		parent.posVector.y = (global_position.y - parent.global_position.y) / max_distance
