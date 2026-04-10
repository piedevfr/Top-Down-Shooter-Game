extends Node
class_name State_Machine
@export var initial_state : State

var current_state : State
var states : Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transition.connect(on_child_tansitioned)
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)
		
	

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func on_child_tansitioned(state, new_state_names):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_names)
	if !new_state:
		return
	
	if current_state:
		current_state.exit()
	
	new_state.enter()
	current_state = new_state
	print("change")
