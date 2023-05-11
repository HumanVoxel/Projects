extends Sprite2D

@export var dialogue_resource : DialogueResource
@export var dialogue_start : String = "empty_fridge"

signal intro_finished
var player_in_area : bool = false
var is_talking : bool = false
var finished_dialogue : bool = false
var player : CharacterBody2D

func _ready():
	DialogueManager.set_process_mode(PROCESS_MODE_ALWAYS)
	$"../U".hide()
	pass
	

func _unhandled_input(event):
	if event.is_action_pressed("dialogic_default_action") and player_in_area and not is_talking and not finished_dialogue:
		show()
#		player.set_physics_process(false)
		is_talking = true
		DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
		print("dialogue started")
		await DialogueManager.dialogue_ended
		is_talking = false
		print("dialogue ended")
		$"../DoorBlock/CollisionShape2D".disabled = true
		$"../PointArrow".show()
		finished_dialogue = true
		PlayerStats.intro_done = true
#		player.set_physics_process(true)
		
func _on_fridge_door_area_body_entered(body):
	if body.name == "Player":
		player_in_area = true
		player = body
		if not PlayerStats.intro_done:
			$"../U".show()
	pass # Replace with function body.


func _on_fridge_door_area_body_exited(body):
	if body.name == "Player":
		player_in_area = false
		player = null
		$"../U".hide()
		hide()
	pass # Replace with function body.
