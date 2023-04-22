extends CharacterBody2D

@export var dialogue_resource : DialogueResource
@export var dialogue_start : String = "start"
@export var dialogue_area_shape : CollisionShape2D

var player_in_area : bool = false
var player : CharacterBody2D
var is_talking : bool = false
var player_got_vaccine : bool
@onready var just_got_vaccinated : bool = PlayerStats.just_got_vaccinated

func _ready():
	dialogue_area_shape.reparent($dialogue_area)
	DialogueManager.set_process_mode(PROCESS_MODE_ALWAYS)
	$U.hide()
	pass
	

func _input(event):
	if not just_got_vaccinated and event.is_action_pressed("dialogic_default_action") and player_in_area and not is_talking:
		player.set_physics_process(false)
		is_talking = true
		DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
		await DialogueManager.dialogue_ended
		just_got_vaccinated = PlayerStats.just_got_vaccinated
		if just_got_vaccinated:
			$U.hide()
			$AnimatedSprite2D.hide()
		is_talking = false
		player.set_physics_process(true)

func _on_dialogue_area_body_entered(body):
	if body.name == "Player" and not just_got_vaccinated:
		player = body
		print("player entered")
		player_in_area = true
		$U.show()
		$AnimatedSprite2D.hide()
	pass # Replace with function body.

func _on_dialogue_area_body_exited(body):
	if body.name == "Player":
		player = null
		print("player exited")
		player_in_area = false
		$U.hide()
		$AnimatedSprite2D.show()
	pass # Replace with function body.
