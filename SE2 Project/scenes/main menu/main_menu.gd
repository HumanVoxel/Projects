extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Play.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_up():
	get_tree().change_scene_to_file("res://scenes/chapter_select/chapter_select.tscn")
	pass # Replace with function body.


func _on_quit_button_up():
	get_tree().quit()
	pass # Replace with function body.
