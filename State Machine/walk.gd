extends State

@export_category("Exit States")
@export var attack : State
@export var damage : State
@export var death : State
@export var duck : State
@export var fall : State
@export var idle : State
@export var jump : State

func on_enter():
	super()

func state_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		next_state = jump
	elif event.is_action_pressed("down"):
		next_state = duck
	elif event.is_action_pressed("attack"):
		next_state = attack
		attack.current_action = "Standing"
	elif !event.is_action_pressed("left") && !event.is_action_pressed("right"):
		next_state = idle

func state_process(delta: float):
	if !player.is_on_floor():
		next_state = fall
