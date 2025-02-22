extends State

@export_category("Exit States")
@export var attack : State
@export var damage : State
@export var death : State
@export var fall : State
@export var idle : State
@export var jump : State

func on_enter():
	super()

func state_input(event: InputEvent):
	if event.is_action_pressed("attack"):
		next_state = attack
		attack.current_action = "Ducking"
	
	if event.is_action_released("down"):
		next_state = idle
