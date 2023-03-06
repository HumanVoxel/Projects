extends State

@onready var animation_tree : AnimationTree = $"../../AnimationTree"
@export var SPEED : float = 300.0
@export var run_acceleration : float = 0.3

@export var idle_node : NodePath
@export var jump_node : NodePath
@export var dash_node : NodePath
@export var fall_node : NodePath
@export var climb_node : NodePath

@onready var idle_state : State = get_node(idle_node)
@onready var jump_state : State = get_node(jump_node)
@onready var dash_state : State = get_node(dash_node)
@onready var fall_state : State = get_node(fall_node)
@onready var climb_state : State = get_node(climb_node)

func enter() -> void:
	print("is-running")

func input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		return jump_state
	if Input.is_action_just_pressed("dash") and owner.is_dash_ready == true:
		return dash_state
	return null

func exit() -> void:
#	owner.velocity = -owner.velocity
	pass
	

func physics_process(delta: float) -> State:
	if owner.is_on_floor():
		owner.is_dash_ready = true
		
	if owner.is_on_wall() and Input.is_action_pressed("climb"):
		return climb_state
		
	if !owner.is_on_floor():
		return fall_state
		
	
		
	var direction = get_side_movement()
	owner.velocity.y += owner.gravity
	owner.move_and_slide()
	
	if direction == 0:
		return idle_state
	
	return null

func get_side_movement() -> float:
	var direction = Input.get_axis("move_left", "move_right")
	if direction and direction != owner.face_direction:
		owner.face_direction = direction
	if direction:
		owner.velocity.x = lerp(owner.velocity.x, direction * SPEED, run_acceleration)
	else:
		owner.velocity.x = move_toward(owner.velocity.x, 0, SPEED)
	return direction
