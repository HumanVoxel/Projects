class_name Virus
extends CharacterBody2D

@export var path_to_player : NodePath

@onready var player : Player = get_parent().get_node("Player")
@onready var virus = $"."
@onready var agent = $NavigationAgent2D

@export var SPEED = 300.0
@export var attack_damage = 10.0

func _ready() -> void:
	agent.target_position = player.global_position
	
func _physics_process(delta):
	agent.target_position = player.global_position
	if agent.is_navigation_finished():
		return
	var direction = global_position.direction_to(agent.get_next_path_position())
	var desired_velocity = direction * SPEED
	var steering = (desired_velocity - velocity) * delta * 4.0 
	velocity += steering
	
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		body.damage(10.0)
		print("touched Player")
	pass # Replace with function body.
