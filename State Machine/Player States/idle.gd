extends State

@export var idle_timer : float = 3.0
@export var second_idle : String
@export var third_idle : String

@export_category("Exit States")
@export var attack : State
@export var damage : State
@export var death : State
@export var duck : State
@export var fall : State
@export var jump : State
@export var walk : State

var current_idle : float = 0.0

func on_enter():
	super()

func state_process(delta: float):
	if current_idle < idle_timer:
		animator.play(animation)
		current_idle += delta
	elif current_idle < idle_timer+0.125:
		animator.play(second_idle)
		current_idle += delta
	else:
		animator.play(third_idle)
	
	if !player.is_on_floor():
		next_state = fall
	
	if abs(player.hdirection) > 0:
		next_state = walk
	
	if player.vdirection > 0:
		next_state = duck

func state_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		next_state = jump
	elif event.is_action_pressed("attack"):
		next_state = attack
		attack.current_action = "Standing"

func on_exit():
	super()
	current_idle = 0.0
