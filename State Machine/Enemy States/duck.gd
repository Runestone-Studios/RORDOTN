extends EnemyState

@export_category("Exit States")
@export var attack : EnemyState
@export var damage : EnemyState
@export var death : EnemyState
@export var fall : EnemyState
@export var idle : EnemyState
@export var jump : EnemyState

func on_enter():
	super()
