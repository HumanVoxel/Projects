extends Node2D

var player_in_area : bool = false
@export var teleport_marker : NodePath
@onready var teleport_marker_node : Marker2D = get_node(teleport_marker)
@export var player_body : CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	$U.hide()
	pass # Replace with function body.

func _unhandled_input(event):
	if player_in_area and event.is_action_pressed("dialogic_default_action"):
		player_body.global_position = teleport_marker_node.global_position
		player_body.is_indoors = true
		pass

func _on_entrance_body_entered(body):
	if body.name == "Player":
		$convenience_store_sprite/Door1WideOpen.show()
		player_in_area = true
		player_body = body
		var convenience_store_sound = AudioBus.play_sound_2d(AudioBus.CONVENIENCE_STORE)
		add_child(convenience_store_sound)
		convenience_store_sound.play()
		$U.show()
	pass # Replace with function body.


func _on_entrance_body_exited(body):
	if body.name == "Player":
		$convenience_store_sprite/Door1WideOpen.hide()
		player_in_area = false
		player_body = null
		$U.hide()
	pass # Replace with function body.
