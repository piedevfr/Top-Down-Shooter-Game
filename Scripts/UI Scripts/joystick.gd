extends TouchScreenButton
class_name Joystick

@onready var knob: Sprite2D = $Knob
@onready var max_distance = shape.radius

var stick_center : Vector2 = texture_normal.get_size() / 2
var touched : bool = false

func _ready() -> void:
	set_process(false)

func _process(delta: float) -> void:
	knob.global_position = get_global_mouse_position()
	knob.position = stick_center + (knob.position - stick_center).limit_length(max_distance)

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			set_process(true)
			touched = true
		elif not event.pressed:
			set_process(false)
			knob.position = stick_center
			touched = false

func get_joystick_direction() -> Vector2:
	var direction = knob.position - stick_center
	return direction.normalized()
