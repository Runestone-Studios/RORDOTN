extends EnemyState

@export_category("Exit States")
@export var attack : EnemyState
@export var damage : EnemyState
@export var death : EnemyState
@export var idle : EnemyState
@export var jump : EnemyState

func on_enter():
	super()

func state_process(delta: float):
	if enemy.is_on_floor():
		next_state = idle
