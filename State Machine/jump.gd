extends State

@export var jump_velocity : float = 300
@export var double_jump_velocity : float = 200

@export_category("Exit States")
@export var attack : State
@export var damage : State
@export var death : State
@export var fall : State

var double_jump : bool = true

func on_enter():
	super()
	if player.is_on_floor():
		player.velocity.y = -jump_velocity
	elif double_jump:
		player.velocity.y = -double_jump_velocity
		double_jump = false

func state_process(delta: float):
	if player.velocity.y > 0:
		next_state = fall

func state_input(event: InputEvent):
	if event.is_action_pressed("attack"):
		next_state = attack
		attack.current_action = "In Air"
	
	if event.is_action_released("jump"):
		player.velocity.y = 0
		next_state = fall
