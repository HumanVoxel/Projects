extends State

@onready var animation_tree : AnimationTree = $"../../AnimationTree"
@export var run_node : NodePath
@export var jump_node : NodePath
@export var dash_node : NodePath
@export var fall_node : NodePath
@export var climb_node : NodePath

@onready var run_state : State = get_node(run_node)
@onready var jump_state : State = get_node(jump_node)
@onready var dash_state : State = get_node(dash_node)
@onready var fall_state : State = get_node(fall_node)
@onready var climb_state : State = get_node(climb_node)

func enter() -> void:
	print('is-idle')

func input(event: InputEvent) -> State:
#	if event.is_action_pressed("move_left") or event.is_action_pressed("move_right"):
#		return run_state
#	elif event.is_action_pressed("jump"):
#		return jump_state
#	elif event.is_action_pressed("dash"):
#		return dash_state
	
	return null

func physics_process(delta: float) -> State:
	owner.move_and_slide()
	if owner.is_on_floor():
		owner.is_dash_ready = true
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		return run_state
	elif Input.is_action_pressed("jump"):
		return jump_state
	elif Input.is_action_pressed("dash") and owner.is_dash_ready == true:
		return dash_state
	elif owner.is_on_floor() and owner.is_on_wall() and Input.is_action_pressed("climb"):
		return climb_state
	if not owner.is_on_floor():
		return fall_state
	return null
