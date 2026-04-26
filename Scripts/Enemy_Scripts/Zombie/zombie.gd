extends Entity

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox: Hitbox = $Hitbox

var state : String = "follow"
var touching_player : bool

func _physics_process(delta: float) -> void:
	print(state)
	if touching_player == true:
		state = "attack"
	
	if state == "follow":
		follow(delta)
	if state == "death":
		if animated_sprite.frame == 10:
			queue_free()
	if state == "attack":
		animated_sprite.play("Attack")
		if animated_sprite.frame == 4:
			attack()
		elif animated_sprite.frame == 9:
			state = "follow"

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
		touching_player = true

func _on_hurtbox_body_exited(body: Node2D) -> void:
	if body is Player:
		touching_player = false

func attack():
	print
