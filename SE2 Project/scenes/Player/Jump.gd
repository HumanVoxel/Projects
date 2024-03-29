extends State

@onready var animation_tree : AnimationTree = $"../../AnimationTree"
@export var air_move_speed : float = 120.0
@export var air_acceleration : float = 0.3
@export var jump_height : float = 36
@export var jump_time_to_peak : float = 0.35
@export var jump_time_to_descent : float

@onready var jump_velocity = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
@onready var wall_detector = $"../../wall_detector"

@export var idle_node : NodePath
@export var run_node : NodePath
@export var jump_node : NodePath
@export var dash_node : NodePath
@export var fall_node : NodePath
@export var climb_node : NodePath

@onready var idle_state : State = get_node(idle_node)
@onready var run_state : State = get_node(run_node)
@onready var jump_state : State = get_node(jump_node)
@onready var dash_state : State = get_node(dash_node)
@onready var fall_state : State = get_node(fall_node)
@onready var climb_state : State = get_node(climb_node)
var wall_direction

func enter():
#	var jump_sound = AudioBus.play_sound_2d(AudioBus.JUMP)
#	add_child(jump_sound)
#	jump_sound.play()
	AudioBus.play_sound_fx(AudioBus.JUMP)
	owner.velocity.y = jump_velocity
	print(owner.face_direction)
	#owner.velocity.y = -jump_height
	print("is-jumping")
		
func exit():
	print(owner.face_direction)
	
func input(event: InputEvent) -> State:
	return null

func physics_process(delta: float) -> State:
	var direction = get_side_movement()
	if Input.is_action_just_released("jump"):
		return fall_state
	else:
		owner.velocity.y += jump_gravity * delta
		
	if get_parent().previous_state == climb_state and Input.is_action_just_pressed("jump"):
#	if owner.is_on_wall() and Input.is_action_pressed("climb") and Input.is_action_just_pressed("jump"):
#	if Input.is_action_pressed("climb") and Input.is_action_just_pressed("jump"):
#		if direction == wall_direction.x:
		get_parent().previous_state == jump_state
		var wall_direction = -owner.get_wall_normal()
		owner.velocity.x = -wall_direction.x * air_move_speed
		owner.velocity.y = jump_velocity
		print("wall_jumped")
		

		
	if Input.is_action_just_pressed("dash") and owner.is_dash_ready == true:
		return dash_state
		

#	get_side_movement()
		
	
	if owner.velocity.y > 0:
		return fall_state
	owner.move_and_slide()
	
	if owner.is_on_wall() and Input.is_action_pressed("climb"):# and wall_detector.is_colliding():
		return climb_state
		
	return null
	
func get_side_movement() -> float:
	var direction = Input.get_axis("move_left", "move_right")
	if direction and direction != owner.face_direction:
		owner.face_direction = direction
	if direction:
		owner.velocity.x = direction * air_move_speed
	else:
		owner.velocity.x = move_toward(owner.velocity.x, 0, air_move_speed)
		
	return owner.velocity.x
