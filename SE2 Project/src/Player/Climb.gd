extends State

@onready var animation_tree : AnimationTree = $"../../AnimationTree"
@export var SPEED : float = 300.0
@export var wall_slide_gravity: float = 10
@export var climb_speed : float = 10
@export var climb_jump_speed : float = 30
var was_on_wall : bool

@export var idle_node : NodePath
@export var run_node : NodePath
@export var jump_node : NodePath
@export var dash_node : NodePath
@export var fall_node : NodePath

@onready var idle_state : State = get_node(idle_node)
@onready var run_state : State = get_node(run_node)
@onready var jump_state : State = get_node(jump_node)
@onready var dash_state : State = get_node(dash_node)
@onready var fall_state : State = get_node(fall_node)


func enter():
	print("is-climbing")

func exit():
	owner.velocity.x = 0
	print(owner.face_direction)
	
func input(event: InputEvent) -> State:
	return null


func physics_process(delta: float) -> State:
	var move_direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized()
	var wall_direction = -owner.get_wall_normal()
	
	if owner.is_on_floor():
		owner.is_dash_ready = true
		
	if move_direction.x and move_direction.x != owner.face_direction:
		owner.face_direction = move_direction.x

	if owner.is_on_wall() and Input.is_action_pressed("climb"):
		if Input.is_action_just_pressed("jump"):
			print("switched to jump")
			return jump_state
		elif Input.is_action_just_pressed("dash") and owner.is_dash_ready == true:
			return dash_state


	
		
	if move_direction.y:
		owner.velocity.y = move_direction.y * climb_speed
	else:
		owner.velocity.y = 0
#	if Input.is_action_just_pressed("jump"):
#		owner.velocity.y += climb_jump_speed
	if owner.is_on_wall():
		was_on_wall = true
		
	owner.move_and_slide() 
	if !owner.is_on_wall() and Input.is_action_pressed("climb") and was_on_wall:
		owner.velocity.x = owner.wall_direction.x * SPEED
	owner.move_and_slide()
	if !owner.is_on_wall():
		return fall_state
#	if owner.is_on_floor():d
#		if move_direction.x != 0:
#			return run_state
#		else:
#			return idle_state

	if Input.is_action_just_released("climb"):
		return fall_state

	return null
