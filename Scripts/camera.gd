extends Camera2D

@onready var player: Node2D = $".."

const MAXDISTANCE = 48

var target_distance = 0
var center_pos = position

func _process(delta: float) -> void:
	var direction = center_pos.direction_to(get_local_mouse_position())
	var target_pos = center_pos + direction * target_distance
	
	target_pos = target_pos.clamp(
		center_pos - Vector2(MAXDISTANCE, MAXDISTANCE),
		center_pos + Vector2(MAXDISTANCE, MAXDISTANCE)
	)
	
	position = target_pos

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		target_distance = center_pos.distance_to(get_local_mouse_position()) / 1.25
		
