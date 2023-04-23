extends State

@onready var animation_tree : AnimationTree = $"../../AnimationTree"
@export var run_node : NodePath
@export var jump_node : NodePath
@export var dash_node : NodePath
@export var fall_node : NodePath
@export var climb_node : NodePath
@onready var wall_detector = $"../../wall_detector"
@onready var run_state : State = get_node(run_node)
@onready var jump_state : State = get_node(jump_node)
@onready var dash_state : State = get_node(dash_node)
@onready var fall_state : State = get_node(fall_node)
@onready var climb_state : State = get_node(climb_node)

func enter() -> void:
#	var ground_sound = AudioBus.play_sound_2d(AudioBus.GROUNDED)
#	add_child(ground_sound)
#	ground_sound.play()
	AudioBus.play_sound_fx(AudioBus.GROUNDED)
	owner.velocity = Vector2.ZERO
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
	if owner.is_on_wall() and Input.is_action_pressed("climb"):# and wall_detector.is_colliding():
		return climb_state
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		return run_state
	elif Input.is_action_just_pressed("jump"):
		return jump_state
	elif Input.is_action_pressed("dash") and owner.is_dash_ready == true:
		return dash_state
	if not owner.is_on_floor():
		return fall_state
	return null
