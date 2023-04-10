extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	$VBoxContainer/Resume.grab_focus()
	pass # Replace with function body.

func _on_resume_pressed():
	get_tree().paused = false
	queue_free()
	pass # Replace with function body.
	

func _on_exit_pressed():
	_on_resume_pressed()
	get_tree().change_scene_to_file("res://scenes/main menu/main_menu.tscn")
	pass # Replace with function body.
