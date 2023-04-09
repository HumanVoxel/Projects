extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	var new_paused_state = not get_tree().paused
	get_tree().paused = new_paused_state
#	visible = new_paused_state
	$VBoxContainer/Resume.grab_focus()
	pass # Replace with function body.

func _on_resume_pressed():
	var new_paused_state = not get_tree().paused
	get_tree().paused = new_paused_state
#	visible = new_paused_state
	queue_free()
	pass # Replace with function body.
	

func _on_exit_pressed():
	_on_resume_pressed()
	get_tree().change_scene_to_file("res://scenes/main menu/main_menu.tscn")
	pass # Replace with function body.
