extends CharacterBody2D

class_name Entity

@onready var hitbox: CollisionShape2D = $Hitbox
@onready var hurtbox_collider: Area2D = $HurtboxCollider
@onready var health_label: Label = $Health
@onready var player: Player = $"../Player"

var Speed = 20
var Health : int = 100

func _process(_delta: float) -> void:
	health_label.text = "Health: %s" %Health

func _physics_process(delta: float) -> void:
	position = position.move_toward(player.position, Speed * delta)
	if Health <= 0:
		die()
	
	move_and_slide()

func die():
	queue_free()

func _on_hurtbox_collider_area_entered(area: Area2D) -> void:
	Health -= Global.BULLET_DAMAGE
	area.get_parent().queue_free()
