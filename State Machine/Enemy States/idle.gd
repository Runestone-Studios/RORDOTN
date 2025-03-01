extends EnemyState

@export_category("Exit States")
@export var attack : EnemyState
@export var damage : EnemyState
@export var death : EnemyState
@export var duck : EnemyState
@export var fall : EnemyState
@export var jump : EnemyState
@export var walk : EnemyState

func on_enter():
	super()

func state_process(delta: float):
	if !enemy.is_on_floor():
		next_state = fall
