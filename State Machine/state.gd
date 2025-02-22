extends Node
class_name State

@export var animation : String
@export var can_move : bool = true
@export var can_rotate : bool = true

var SM : StateMachine
var player : Player
var animator : AnimationPlayer
var next_state : State

func on_enter():
	animator.play(animation)

func on_exit():
	pass

func state_process(delta: float):
	pass

func state_input(event: InputEvent):
	pass
