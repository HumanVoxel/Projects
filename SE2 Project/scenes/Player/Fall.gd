extends State

@onready var animation_tree : AnimationTree = $"../../AnimationTree"
@export var air_move_speed : float = 120.0
@export var air_acceleration : float = 0.3
@export var max_fall_speed : float = 300
@export var jump_height : float = 36.0
@export var jump_time_to_descent : float = 0.315
@onready var fall_gravity = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0
@onready var wall_detector = $"../../wall_detector"
@export var idle_node : NodePath
@export var run_node : NodePath
@export var jump_node : NodePath
@export var dash_node : NodePath
@export var climb_node : NodePath

@onready var idle_state : State = get_node(idle_node)
@onready var run_state : State = get_node(run_node)
@onready var jump_state : State = get_node(jump_node)
@onready var dash_state : State = get_node(dash_node)
@onready var climb_state : State = get_node(climb_node)


func enter() -> void:
	print('is-falling')
	
func input(event: InputEvent) -> State:
	return null


func physics_process(delta: float) -> State:
	if Input.is_action_just_pressed("dash") and owner.is_dash_ready == true:
		return dash_state
	
	if owner.is_on_wall() and Input.is_action_pressed("climb") and wall_detector.is_colliding():
		return climb_state
		
	if owner.is_on_floor():
		owner.is_dash_ready = true
		if owner.velocity.x != 0:
			return run_state
		else:
			return idle_state
	
	get_side_movement()
	owner.velocity.y += fall_gravity * delta
	owner.velocity.y = min(owner.velocity.y, max_fall_speed)
	owner.move_and_slide()

	return null
	
func get_side_movement() -> void:
	var direction = Input.get_axis("move_left", "move_right")
	if direction and direction != owner.face_direction:
		owner.face_direction = direction
	if direction:
#		owner.velocity.x = lerp(owner.velocity.x, direction * air_move_speed, air_acceleration)
		owner.velocity.x = direction * air_move_speed
	else:
		owner.velocity.x = move_toward(owner.velocity.x, 0, air_move_speed)
