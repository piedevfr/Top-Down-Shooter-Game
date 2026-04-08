extends State
class_name ZombieBite

func enter():
	await get_tree().create_timer(5).timeout
	print("Biting...")
	transition.emit(ZombieBite , ZombieFollow)
