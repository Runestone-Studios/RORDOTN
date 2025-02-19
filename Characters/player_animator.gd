extends Node2D

@export var player_controller : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

var idle_timer : float = 3.0
var current_idle : float = 0.0
var final_pose : bool = false

func _process(delta):
	if player_controller.direction == 1:
		sprite.flip_h = false
	elif player_controller.direction == -1:
		sprite.flip_h = true
	
	if abs(player_controller.velocity.x) > 0:
		current_idle = 0.0
		animation_player.play("Walk")
	else:
		if current_idle < idle_timer:
			animation_player.play("Idle_1")
			current_idle += delta
		elif current_idle < idle_timer+0.125:
			animation_player.play("Idle_2")
			current_idle += delta
		else:
			animation_player.play("Idle_3")
	
	if player_controller.velocity.y != 0:
		current_idle = 0.0
		if player_controller.velocity.y < 0:
			animation_player.play("Jump")
		elif player_controller.velocity.y > 0:
			animation_player.play("Fall")
