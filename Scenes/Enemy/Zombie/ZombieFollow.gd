extends State
class_name ZombieFollow

@onready var target_player : CharacterBody2D = get_tree().get_first_node_in_group("Player")
@onready var zombie: CharacterBody2D = $"../.."
var move_speed : float = 100.0

func enter():
	pass

func physics_update(delta : float):
	#var direction = zombie.global_position.direction_to(target_player.global_position)
	#zombie.velocity = direction * move_speed
	
	var direction = target_player.global_position - zombie.global_position
	
	if direction.length() < 100:
		transition.emit(ZombieFollow , ZombieBite)
	zombie.velocity = direction.normalized() * move_speed
	
	print(direction.length())
	zombie.move_and_slide()
