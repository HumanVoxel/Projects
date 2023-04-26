extends CanvasLayer

var next_chapter_resource : String

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	$"ColorRect/VBoxContainer/Next Chapter".grab_focus()
	pass # Replace with function body.


func _on_next_chapter_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file(next_chapter_resource)
	pass # Replace with function body.

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main menu/main_menu.tscn")
	pass # Replace with function body.
