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
	elif event.is_action_pressed("attack"):
		next_state = attack
		attack.current_action = "Standing"

func state_process(delta: float):
	if !player.is_on_floor():
		next_state = fall
	
	if player.velocity.x == 0:
		next_state = idle
	
	if player.vdirection > 0:
		next_state = duck
