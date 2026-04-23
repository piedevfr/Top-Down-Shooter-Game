extends CharacterBody2D
class_name Entity


@onready var hurtbox : Hurtbox
@onready var health_label : Label = $Health
@onready var player : Player

@export var show_health : bool
@export var Speed = 20
@export var health : int = 100


func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	for child in get_children():
		if child is Hurtbox:
			hurtbox = child
			hurtbox.hurtbox_entered.connect(_on_hurtbox_entered)
			break

func _process(_delta: float) -> void:
	if show_health == true:
		health_label.visible = true
		health_label.text = "Health: %s" %health
	elif show_health == false:
		health_label.visible = false
	
	if health <= 0:
		die()

func _physics_process(delta: float) -> void:
	move_and_slide()

func move_to_player(delta : float):
	position = position.move_toward(player.position, Speed * delta)

func _on_hurtbox_entered(hitbox : Hitbox, damage : int):
	health -= damage

func die():
	pass
