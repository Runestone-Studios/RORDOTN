extends CharacterBody2D
class_name Player

@export var speed : float = 200
@export var sprite : Sprite2D
@export var SM : StateMachine

var falling : bool = false
var hdirection = 0
var vdirection = 0

func _physics_process(delta: float) -> void:
	if SM.current_state:
		$StateDebug.text = "State: " + SM.current_state.name
	
	# Handle Gravity
	if !is_on_floor():
		velocity += get_gravity() * delta
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	hdirection = Input.get_axis("left", "right")
	if hdirection && SM.current_state.can_move:
		velocity.x = hdirection * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	vdirection = Input.get_axis("up", "down")

	move_and_slide()
