extends Node2D

@export var dialogue_resource : DialogueResource
@export var dialogue_start : String = "chapter2_tv_start"

# Called when the node enters the scene tree for the first time.
func _ready():
	$"../Player".set_physics_process(false)
	await get_tree().create_timer(1).timeout
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	await DialogueManager.dialogue_ended
	$"../Player".set_physics_process(true)
	queue_free()
	pass # Replace with function body.
