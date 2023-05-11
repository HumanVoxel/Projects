extends Node2D

@export var teleport_marker : NodePath
@onready var teleport_marker_node : Marker2D = get_node(teleport_marker)

func _ready():
	if PlayerStats.intro_done:
		$DoorBlock/CollisionShape2D.disabled = true
		$PointArrow.show()
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_body_entered(body):
	if body.name == "Player":
		body.global_position = teleport_marker_node.global_position
		body.is_indoors = false
	pass # Replace with function body.


func _on_camera_segment_body_entered(body):
	pass # Replace with function body.


func _on_camera_segment_body_exited(body):
	pass # Replace with function body.
