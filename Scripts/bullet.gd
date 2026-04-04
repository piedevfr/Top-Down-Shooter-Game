extends Node2D

var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation = get_parent().rotation
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		position *= speed
