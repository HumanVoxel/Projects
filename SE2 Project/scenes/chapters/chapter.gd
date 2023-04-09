extends Node2D

var pause_node = preload("res://scenes/pause/pause.tscn")
var game_over_node = preload("res://scenes/game_over/game_over.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	$NavigationRegion2D/Player.gameOver.connect(_on_Game_Over)
	pass # Replace with function body.


func _input(event):
	if get_tree().paused == false and event.is_action_pressed("pause"):
		add_child(pause_node.instantiate())
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Game_Over():
	add_child(game_over_node.instantiate())
