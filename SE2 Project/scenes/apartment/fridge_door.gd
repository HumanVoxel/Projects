extends Sprite2D

@export var dialogue_resource : DialogueResource
@export var dialogue_start : String = "empty_fridge"

var player_in_area : bool = false
var is_talking : bool = false

func _ready():
	DialogueManager.set_process_mode(PROCESS_MODE_ALWAYS)
	pass
	

func _unhandled_input(event):
	if event.is_action_pressed("dialogic_default_action") and player_in_area:
		show()
		is_talking = true
		DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
		await DialogueManager.dialogue_ended
		is_talking = false
		
func _on_fridge_door_area_body_entered(body):
	if body.name == "Player":
		player_in_area = true
	pass # Replace with function body.


func _on_fridge_door_area_body_exited(body):
	if body.name == "Player":
		player_in_area = false
		hide()
	pass # Replace with function body.
