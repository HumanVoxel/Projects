extends Node2D

@export var teleport_marker : NodePath
@onready var teleport_marker_node : Marker2D = get_node(teleport_marker)


func _on_exit_body_entered(body):
	if body.name == "Player":
		body.global_position = teleport_marker_node.global_position
		body.is_indoors = false
	pass # Replace with function body.


func _on_fridge_door_area_body_entered(body):
	if body.name == "Player":
		$fridge_door.show()
	pass # Replace with function body.


func _on_fridge_door_area_body_exited(body):
	if body.name == "Player":
		$fridge_door.hide()
	pass # Replace with function body.
