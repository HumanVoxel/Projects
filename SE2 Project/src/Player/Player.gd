class_name Player
extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dash_ready : bool
var wall_direction : Vector2

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")
@onready var animation_player = $AnimationPlayer
@onready var states = $state_manager
@onready var face_direction : int = 1

func _ready() -> void:
	states.init()

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	if is_on_wall():
		wall_direction = -get_wall_normal()
			
	if Input.is_action_just_pressed("attack"):
		animation_player.play("attack")
	update_animation_parameters()
	states.physics_process(delta)
		
func _process(delta: float) -> void:
	states.process(delta)

func update_animation_parameters() -> void:
	animation_tree.set("parameters/climb/blend_position", Vector2(wall_direction.x, velocity.y))
	animation_tree.set("parameters/dash/blend_position", velocity.x)
	animation_tree.set("parameters/fall/blend_position", velocity.x)
	animation_tree.set("parameters/jump/blend_position", velocity.x)
	animation_tree.set("parameters/walk/blend_position", velocity.x)
	pass
