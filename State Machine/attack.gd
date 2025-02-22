extends State

@export_enum("Standing", "Ducking", "In Air") var current_action : String = "Standing"
@export var strength : float
@export var standing : String
@export var ducking : String
@export var in_air : String

@export_category("Exit States")
@export var damage : State
@export var death : State
@export var duck : State
@export var fall : State
@export var idle : State
@export var jump : State

func on_enter():
	match(current_action):
		"Standing":
			animation = standing
			can_move = false
		"Ducking":
			animation = ducking
			can_move = false
		"In Air":
			animation = in_air
			can_move = true
	super()

func state_process(delta: float):
	var pos = animator.current_animation_position
	match(current_action):
		"Standing":
			if !player.is_on_floor():
				current_action = "In Air"
				animator.play(in_air)
				animator.seek(pos,true)
				can_move = true
		"Ducking":
			if !player.is_on_floor():
				current_action = "In Air"
				animator.play(in_air)
				animator.seek(pos,true)
				can_move = true
		"In Air":
			if player.is_on_floor():
				current_action = "Standing"
				animator.play(standing)
				animator.seek(pos,true)
				can_move = false
				jump.double_jump = true
	
	if animator.animation_finished:
		match(current_action):
			"Standing":
				next_state = idle
			"Ducking":
				next_state = duck
			"In Air":
				next_state = fall
