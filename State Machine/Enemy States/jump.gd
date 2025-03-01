extends EnemyState

@export var jump_velocity : float = 300

@export_category("Exit States")
@export var attack : EnemyState
@export var damage : EnemyState
@export var death : EnemyState
@export var fall : EnemyState

func on_enter():
	super()
	if enemy.is_on_floor():
		enemy.velocity.y = -jump_velocity

func state_process(delta: float):
	if enemy.velocity.y > 0:
		next_state = fall
