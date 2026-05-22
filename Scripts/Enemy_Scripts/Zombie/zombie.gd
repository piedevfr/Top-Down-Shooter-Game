extends Entity

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var attack_cooldown : Timer = Timer.new()
#@onready var hitbox: Hitbox = $Hitbox

var state : String = "follow"

func _physics_process(delta: float) -> void:
	print(state)
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
	state = STATE.DEAD
	takes_damage = false
	show_health = false
	alive = false
	animated_sprite.play("Die")

func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body is Player:
		state = "attack"


func attack():
	var animation = "Attack"
	for child in get_children():
		if child is Hitbox:
			child.queue_free()
	if can_attack == true:
		var weapon = Hitbox.new()
		weapon.damage_amount = 10 / 2
		weapon.free_on_collision = false
		var collision
		for child in get_children():
			if child is CollisionShape2D:
				collision = child.duplicate()
				break
		add_child(weapon)
		weapon.add_child(collision)
		can_attack = false
		attack_cooldown.start((animated_sprite.sprite_frames.get_animation_speed(animation) / animated_sprite.sprite_frames.get_frame_count(animation))/2)
		#weapon.queue_free()
		#collision.queue_free()


func on_attack_cooldown_timeout():
	can_attack = true
