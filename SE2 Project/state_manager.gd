extends Node

@export var starting_state : NodePath
var current_state: State


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
	if current_state:
		current_state.exit()
		
	current_state = new_state
	change_animation_state()
	current_state.enter()

func change_animation_state() -> void:
	if current_state == $Idle:
		owner.animation_state.travel("idle")
	elif current_state == $Run:
		owner.animation_state.travel("walk")
	elif current_state == $Jump:
		owner.animation_state.travel("jump")
	elif current_state == $Dash:
		owner.animation_state.travel("dash")
	elif current_state == $Fall:
		owner.animation_state.travel("fall")
	elif current_state == $Climb:
		owner.animation_state.travel("climb")
	elif current_state == $Climb:
		owner.animation_state.travel("climb")
	pass
