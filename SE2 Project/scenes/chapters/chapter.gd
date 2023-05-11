extends Node2D

var pause_node = preload("res://scenes/pause/pause.tscn")
var game_over_node = preload("res://scenes/game_over/game_over.tscn")
var dialogue_resource : DialogueResource = preload("res://resources/dialogues/chapter2.dialogue")
var dialogue_start = "start"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerStats.just_got_vaccinated = false
	$GameLevel/apartment_inside/PointArrow.hide()
	$Player.gameOver.connect(_on_Game_Over)
	AudioBus.play_global_music(AudioBus.BIT_SAMPLE)

	if not PlayerStats.intro_done:
		DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
		pass

	PlayerStats.current_chapter = "Chapter2"
	pass # Replace with function body.s

func _unhandled_input(event):
	if not get_node("Pause") and event.is_action_pressed("pause"):
		add_child(pause_node.instantiate())

func _on_Game_Over():
	add_child(game_over_node.instantiate())
