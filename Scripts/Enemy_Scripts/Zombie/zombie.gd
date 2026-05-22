extends Entity

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var attack_cooldown : Timer = Timer.new()
#@onready var hitbox: Hitbox = $Hitbox

enum STATE{
	ATTACK,
	FOLLOW,
	DEAD
}

var state : STATE
var touching_player : bool
var can_attack : bool = true
var alive: bool = true


func _ready() -> void:
	initialize_entity()
	attack_cooldown.timeout.connect(on_attack_cooldown_timeout)
	add_child(attack_cooldown)


func _physics_process(delta: float) -> void:
	#print(animated_sprite.sprite_frames.get_animation_speed("Attack") / animated_sprite.sprite_frames.get_frame_count("Attack"))
	#print(animated_sprite.frame)
	#print(can_attack)
	if touching_player == true:
		state = STATE.ATTACK
	elif alive:
		state = STATE.FOLLOW
	
	match state:
		STATE.FOLLOW:
			follow(delta)
		STATE.DEAD:
			alive = false
			if animated_sprite.frame == 10:
				queue_free()
		STATE.ATTACK:
			if alive == true:
				if animated_sprite.animation != "Attack":
					animated_sprite.play("Attack")
				print(animated_sprite.animation, animated_sprite.frame)
				if animated_sprite.frame == 4:
					attack()
				elif animated_sprite.frame == 9 and touching_player == false:
					state = STATE.FOLLOW


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
	if body == player:
		touching_player = true


func _on_hurtbox_body_exited(body: Node2D) -> void:
	if body == player:
		touching_player = false


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
