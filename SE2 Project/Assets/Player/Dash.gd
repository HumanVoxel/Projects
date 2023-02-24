extends State

@export var dash_speed : float =  300.0
@export var dash_time : float = .015
var dash_direction : Vector2

@export var idle_node : NodePath
@export var run_node : NodePath
@export var jump_node : NodePath
@export var fall_node : NodePath
@export var climb_node : NodePath

@onready var idle_state : State = get_node(idle_node)
@onready var run_state : State = get_node(run_node)
@onready var jump_state : State = get_node(jump_node)
@onready var fall_state : State = get_node(fall_node)
@onready var climb_state : State = get_node(climb_node)

var dash_timer : SceneTreeTimer

func enter() -> void:
	dash_timer = get_tree().create_timer(dash_time)
	dash_direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized()
	owner.is_dash_ready = false
#	print(owner.face_direction)
	print("is-dashing")
	
func exit() -> void:
	owner.velocity = owner.velocity * 0.5
	owner.move_and_slide()
	pass
	
func input(event: InputEvent) -> State:
	return null

func process(delta: float) -> State:
	return null
	
func physics_process(delta: float) -> State:
	
		
	if dash_timer.time_left > 0:
		if dash_direction:
			owner.velocity = dash_direction * dash_speed
		else:
			owner.velocity.x = owner.face_direction * dash_speed
			

	else:
		if owner.is_on_wall() and Input.is_action_pressed("climb"):
			return climb_state
		elif owner.is_on_floor() and owner.velocity.x != 0:
			return run_state
		elif not owner.is_on_floor():
			return fall_state
		else:
			return idle_state
	owner.move_and_slide()

	return null
