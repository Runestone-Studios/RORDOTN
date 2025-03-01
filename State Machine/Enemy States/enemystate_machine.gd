extends Node
class_name EnemyStateMachine

@export var enemy : Enemy
@export var animator : AnimationPlayer
@export var current_state : EnemyState

var states : Array[EnemyState]
var on_ground : bool
var ducking : bool

func _ready() -> void:
	for child in get_children():
		if child is EnemyState:
			states.append(child)
			
			child.SM = self
			child.enemy = enemy
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
	on_ground = enemy.is_on_floor()

func change_state(new_state: EnemyState):
	if current_state:
		await current_state.on_exit()
		current_state.next_state = null
		current_state = new_state
		await current_state.on_enter()
