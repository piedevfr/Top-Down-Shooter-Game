extends State
class_name ZombieBite

func enter():
	await get_tree().create_timer(3).timeout
	print("Biting...")
	transition.emit(self , ZombieFollow)
