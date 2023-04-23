extends Node2D

@export var teleport_marker : NodePath
@onready var teleport_marker_node : Marker2D = get_node(teleport_marker)
var player_on_fridge_area : bool

func _ready():
	if PlayerStats.intro_done:
		$DoorBlock/CollisionShape2D.disabled = true
		$PointArrow.show()

func _on_exit_body_entered(body):
	if body.name == "Player":
		body.global_position = teleport_marker_node.global_position
		body.is_indoors = false
	pass # Replace with function body.
