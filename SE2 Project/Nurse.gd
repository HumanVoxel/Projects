extends CharacterBody2D

@export var dialogue_resource : DialogueResource
@export var dialogue_start : String = "start"
@export var dialogue_area_shape : CollisionShape2D

var player_in_area : bool = false
var is_talking : bool = false

func _ready():
	dialogue_area_shape.reparent($dialogue_area)
	DialogueManager.set_process_mode(PROCESS_MODE_ALWAYS)
	pass
	

func _input(event):
	if event.is_action_pressed("dialogic_default_action") and player_in_area and not is_talking:
		is_talking = true
		DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
		await DialogueManager.dialogue_ended
		is_talking = false

func _on_dialogue_area_body_entered(body):
	if body.name == "Player":
		print("player entered")
		player_in_area = true
	pass # Replace with function body.

func _on_dialogue_area_body_exited(body):
	if body.name == "Player":
		print("player exited")
		player_in_area = false
	pass # Replace with function body.
