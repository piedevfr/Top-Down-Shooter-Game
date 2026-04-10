var Health : int = 100

func _on_hurtbox_collider_body_entered(body: Node2D) -> void:
	if body is Bullet:
		Health -= 20
