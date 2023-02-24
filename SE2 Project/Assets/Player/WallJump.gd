extends State

@export var air_move_speed : float = 300.0
@export var air_acceleration : float = 0.3
@export var jump_height : float
@export var jump_time_to_peak : float
@export var jump_time_to_descent : float
@export var wall_jump_time : float

@onready var jump_velocity = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0

var wall_jump_timer : SceneTreeTimer
var wall_jump_direction : Vector2

@export var idle_node : NodePath
@export var run_node : NodePath
@export var dash_node : NodePath
@export var fall_node : NodePath
@export var climb_node : NodePath
@export var jump_node : NodePath

@onready var idle_state : State = get_node(idle_node)
@onready var run_state : State = get_node(run_node)
@onready var dash_state : State = get_node(dash_node)
@onready var fall_state : State = get_node(fall_node)
@onready var climb_state : State = get_node(climb_node)
@onready var jump_state : State = get_node(jump_node)

func enter():
	var wall_direction = -owner.get_wall_normal()
	owner.velocity.x = -wall_direction.x
	print(owner.velocity.x)
	owner.move_and_slide()
	print("is-wall-jumping")
		
func input(event: InputEvent) -> State:
	return null

func physics_process(delta: float) -> State:
#	if !owner.is_on_floor() and owner.is_on_wall() and Input.is_action_pressed("climb"):
#		return climb_state

#	get_side_movement()
#	if Input.is_action_pressed("jump"):
#			wall_jump_timer = get_tree().create_timer(wall_jump_time)
#	if wall_jump_timer.time_left > 0:
#		wall_jump_direction = Vector2(wall_direction, -1) .normalized()
#		owner.velocity = wall_jump_direction * 30

			
#	owner.move_and_slide()
		
#	if Input.is_action_just_released("jump"):
#		return fall_state
#	else:
#		owner.velocity.y += jump_gravity * delta
		
	if owner.velocity.y > 0:
		return fall_state
	owner.move_and_slide()

	
		


	return null
	
func get_side_movement() -> void:
	var direction = Input.get_axis("move_left", "move_right")
	if direction and direction != owner.face_direction:
		owner.face_direction = direction
	if direction:
		owner.velocity.x = direction * air_move_speed
	else:
		owner.velocity.x = move_toward(owner.velocity.x, 0, air_move_speed)
