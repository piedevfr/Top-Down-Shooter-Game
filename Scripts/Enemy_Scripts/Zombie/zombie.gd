extends Entity

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var state : String = "follow"

func _physics_process(delta: float) -> void:
	if state == "follow":
		follow(delta)
	

func follow(delta : float):
	move_to_player(delta)
	animated_sprite.play("Run")
