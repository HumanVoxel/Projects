extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_game_over():
	show()
	get_tree().paused = true
	pass # Replace with function body.


func _on_restart_button_up():
	get_tree().paused = false
	get_tree().reload_current_scene()
	pass # Replace with function body.
