extends CharacterBody2D

class_name Entity
@export var show_health : bool

@onready var hitbox: CollisionShape2D = $Hitbox
@onready var hurtbox_collider: Area2D = $HurtboxCollider
@onready var health_label: Label = $Health
@onready var player: Player = $"../Player"
@onready var hurt_box

@export var Speed = 20
@export var Health : int = 100

func _process(_delta: float) -> void:
	if show_health == true:
		health_label.visible = true
		health_label.text = "Health: %s" %Health
	elif show_health == false:
		health_label.visible = true

func _physics_process(delta: float) -> void:
	move_to_player(delta)
	if Health <= 0:
		die()
	move_and_slide()

func die():
	queue_free()

func _on_hurtbox_collider_area_entered(bullet: Node2D) -> void:
	Health -= Global.BULLET_DAMAGE
	bullet.get_parent().queue_free()

func move_to_player(delta : float):
	position = position.move_toward(player.position, Speed * delta)
