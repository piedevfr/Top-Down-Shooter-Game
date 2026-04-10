extends State
class_name ZombieFollow

@onready var target_player : CharacterBody2D = get_tree().get_first_node_in_group("Player")
@onready var proximity_sensor: Area2D = $"../../ProximitySensor"
@onready var zombie: CharacterBody2D = $"../.."
var move_speed : float = 100.0

func enter():
	pass

func physics_update(delta : float):
	#var direction = zombie.global_position.direction_to(target_player.global_position)
	#zombie.velocity = direction * move_speed
	
	var direction = target_player.global_position - zombie.global_position
	zombie.velocity = direction.normalized() * move_speed
	
	zombie.move_and_slide()


func _on_proximity_sensor_body_entered(body: Node2D) -> void:
	if body is Player:
		#transition.emit(ZombieFollow , ZombieBite)
		#zombie.queue_free()
		print("touched")
