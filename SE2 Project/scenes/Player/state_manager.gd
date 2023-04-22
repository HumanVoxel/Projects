class_name StateManager
extends Node

@export var starting_state : NodePath
@export var super_dash_state : State
@export var jump_state : State
var current_state: State
var previous_state: State


func init() -> void:
	change_state(get_node(starting_state))
	

func process(delta: float) -> void:
	var new_state = current_state.process(delta)
	if new_state:
		change_state(new_state)


func physics_process(delta: float) -> void:
	var new_state = current_state.physics_process(delta)
	if new_state:
		change_state(new_state)

	
	if owner.face_direction == 1 and $"../AnimatedSprite2D".flip_h == true:
		$"../AnimatedSprite2D".flip_h = false
	elif owner.face_direction == -1 and $"../AnimatedSprite2D".flip_h == false:
		$"../AnimatedSprite2D".flip_h = true

		
func input(event: InputEvent) -> void:
	var new_state = current_state.input(event)
	if new_state:
		change_state(new_state)


func change_state(new_state: State) -> void:
	previous_state = current_state
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state.enter()
	change_animation_state(new_state)

func change_animation_state(new_state: State) -> void:
	if new_state == $Idle:
		owner.animation_state.travel("idle")
	elif new_state == $Run:
		owner.animation_state.travel("walk")
	elif new_state == $Jump:
		owner.animation_state.travel("jump")
	elif new_state == $Dash:
		owner.animation_state.travel("dash")
	elif new_state == $Fall:
		owner.animation_state.travel("fall")
	elif new_state == $Climb:
		owner.animation_state.travel("climb")
	elif new_state == $Super_Dash:
		owner.animation_state.travel("dash")
	pass
