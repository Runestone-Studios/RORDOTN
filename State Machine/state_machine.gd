extends Node
class_name StateMachine

@export var player : Player
@export var animator : AnimationPlayer
@export var current_state : State

var states : Array[State]
var on_ground : bool
var ducking : bool

func _ready() -> void:
	for child in get_children():
		if child is State:
			states.append(child)
			
			child.SM = self
			child.player = player
			child.animator = animator
			
		else:
			push_warning("Child " + child.name + " is not a valid State.")
	
	if current_state:
		current_state.on_enter()

func _process(delta: float) -> void:
	if current_state:
		if current_state.next_state:
			change_state(current_state.next_state)
		current_state.state_process(delta)
	on_ground = player.is_on_floor()
	
	if player.direction == 1:
		player.sprite.flip_h = false
	elif player.direction == -1:
		player.sprite.flip_h = true

func _input(event: InputEvent):
	if current_state:
		current_state.state_input(event)

func change_state(new_state: State):
	if current_state:
		await current_state.on_exit()
		current_state.next_state = null
		current_state = new_state
		await current_state.on_enter()
