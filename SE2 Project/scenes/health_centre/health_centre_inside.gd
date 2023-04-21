extends Node2D

var player_in_area : bool = false
@export var teleport_marker : NodePath
@onready var teleport_marker_node : Marker2D = get_node(teleport_marker)
var player_body : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$U.hide()
	pass # Replace with function body.


func _unhandled_input(event):
	if player_in_area and event.is_action_pressed("dialogic_default_action"):
		player_body.global_position = teleport_marker_node.global_position
		player_body.is_indoors = false


func _on_exit_body_entered(body):
	if body.name == "Player":
		$door.show()
		$U.show()
		player_in_area = true
		player_body = body
	pass # Replace with function body.

func _on_exit_body_exited(body):
	player_in_area = false
	$door.hide()
	$U.hide()
	pass # Replace with function body.

func _on_camera_segment_body_entered(body):
	pass # Replace with function body.


func _on_camera_segment_body_exited(body):
	pass # Replace with function body.

