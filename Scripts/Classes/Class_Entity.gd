extends CharacterBody2D

class_name Entity

@onready var hitbox: CollisionShape2D = $Hitbox
@onready var hurtbox_collider: Area2D = $HurtboxCollider

var Health : int = 100

func _on_hurtbox_collider_body_entered(body: Node2D) -> void:
	if body is Bullet:
		Health -= Global.BULLET_DAMAGE
