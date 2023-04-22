extends State

@onready var animation_tree : AnimationTree = $"../../AnimationTree"
@export var dash_speed : float =  270.0
@export var dash_delay : float = 0.5
var dash_direction : Vector2
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


var dash_delay_timer : SceneTreeTimer

func enter() -> void:
#	var dash_sound = AudioBus.play_sound_2d(AudioBus.DASH)
#	add_child(dash_sound)
#	dash_sound.play()

	dash_delay_timer = get_tree().create_timer(dash_delay)
	owner.velocity.y = 0

	if dash_direction.x and dash_direction.x != owner.face_direction:
		owner.face_direction = dash_direction.x
#	print(owner.face_direction)
	print("is-super-dashing")
	
func exit() -> void:
	owner.velocity = owner.velocity * 0.5
	owner.move_and_slide()
	pass
	
func input(event):
	pass
	
func physics_process(delta: float) -> State:
	if owner.is_on_floor():
		return idle_state
	elif owner.is_on_ceiling() or owner.is_on_wall() and not owner.is_on_floor():
		return fall_state
	elif owner.is_on_wall() and Input.is_action_pressed("climb") and wall_detector.is_colliding():
		return climb_state
	elif owner.is_dash_ready == true and Input.is_action_pressed("dash"):
		return dash_state
		
	if dash_delay_timer.time_left > 0:
		dash_direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized()
		print(dash_delay_timer.time_left)
		print("istimerrunningstill")
		return null
		
	if dash_direction:
		owner.velocity = dash_direction * dash_speed
	else:
		owner.velocity.x = owner.face_direction * dash_speed
			


	
#	elif owner.is_on_floor() and owner.velocity.x != 0:
#		return run_state
#	elif not owner.is_on_floor():
#		return fall_state
#	else:
#		return idle_state
	owner.move_and_slide()

	return null
