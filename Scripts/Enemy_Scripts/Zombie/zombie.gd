extends Entity

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox: Hitbox = $Hitbox

var state : String = "follow"

func _physics_process(delta: float) -> void:
	if state == "follow":
		follow(delta)
	if state == "death":
		if animated_sprite.frame == 10:
			queue_free()
	print("existing")

func follow(delta : float):
	move_to_player(delta)
	animated_sprite.play("Run")

func die():
	state = "death"
	takes_damage = false
	show_health = false
	animated_sprite.play("Die")

func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body is Player:
		print("ar")
