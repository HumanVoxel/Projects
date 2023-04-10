extends Node2D

@export var teleport_marker : NodePath
@onready var teleport_marker_node : Marker2D = get_node(teleport_marker)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_body_entered(body):
	if body.name == "Player":
		body.global_position = teleport_marker_node.global_position
	pass # Replace with function body.
