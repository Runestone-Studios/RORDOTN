extends Node
class_name EnemyState

@export var animation : String
@export var can_move : bool = true
@export var can_turn : bool = true

var SM : EnemyStateMachine
var enemy : Enemy
var animator : AnimationPlayer
var next_state : EnemyState

func on_enter():
	animator.play(animation)

func on_exit():
	pass

func state_process(delta: float):
	pass

func take_damage(amt: float):
	pass
