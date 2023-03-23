class_name Player
extends CharacterBody2D

var health = 100
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dash_ready : bool
var wall_direction : Vector2

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")
@onready var animation_player = $AnimationPlayer
@onready var states = $state_manager
@onready var face_direction : int = 1
@onready var original_parent = get_parent()
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
	animation_tree.set("parameters/fall/blend_position", (face_direction if velocity.x == 0 else velocity.x))
	animation_tree.set("parameters/jump/blend_position", (face_direction if velocity.x == 0 else velocity.x))
	animation_tree.set("parameters/walk/blend_position", velocity.x)
	pass


func _on_hostile_detector_body_entered(body):
	print("touched hostile")
	queue_free()
	pass # Replace with function body.


func _on_hostile_detector_area_entered(area):
	print("touched hostile")
	queue_free()
	pass # Replace with function body.
	
func damage(damage : float) -> void:
	health -= damage
	print(health)
	pass
	
