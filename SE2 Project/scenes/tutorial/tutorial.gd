extends Node2D

var pause_node = preload("res://scenes/pause/pause.tscn")
var game_over_node = preload("res://scenes/game_over/game_over.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.gameOver.connect(_on_Game_Over)
	pass # Replace with function body.

func _unhandled_input(event):
	if not get_node("Pause") and event.is_action_pressed("pause"):
#		var pause = pause_node.instantiate()
#		pause.process_mode = Node.PROCESS_MODE_ALWAYS
		add_child(pause_node.instantiate())
		
func _on_Game_Over():
	add_child(game_over_node.instantiate())
