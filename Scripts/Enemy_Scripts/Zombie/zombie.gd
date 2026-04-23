extends Entity

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var state : String = "follow"

func _physics_process(delta: float) -> void:
	if state == "follow":
		follow(delta)
	if state == "death":
		if animated_sprite.frame == 10:
			queue_free()

func follow(delta : float):
	move_to_player(delta)
	animated_sprite.play("Run")

func die():
	state = "death"
	animated_sprite.play("Die")
