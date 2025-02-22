extends CharacterBody2D
class_name Player

@export var speed : float = 200
@export var sprite : Sprite2D
@export var SM : StateMachine

var falling : bool = false
var direction = 0

func _physics_process(delta: float) -> void:
	if SM.current_state:
		$StateDebug.text = "State: " + SM.current_state.name
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("left", "right")
	if direction && SM.current_state.can_move:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
