extends CharacterBody2D
class_name PlayerController

@export var speed : float = 200
@export var jump_velocity : float = 300
@export var double_jump_velocity : float = 200

var falling : bool = false
var double_jump : bool = true
var direction = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if velocity.y > 0:
			falling = true
	elif !double_jump:
		double_jump = true
		falling = false

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = -jump_velocity
		elif double_jump:
			velocity.y = -double_jump_velocity
			double_jump = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
