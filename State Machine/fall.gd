extends State

@export_category("Exit States")
@export var attack : State
@export var damage : State
@export var death : State
@export var idle : State
@export var jump : State

func on_enter():
	super()

func state_process(delta: float):
	if player.is_on_floor():
		next_state = idle
		jump.double_jump = true
	else:
		player.velocity += player.get_gravity() * delta

func state_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		if jump.double_jump:
			next_state = jump
	
	if event.is_action_pressed("attack"):
		next_state = attack
		attack.current_action = "In Air"
