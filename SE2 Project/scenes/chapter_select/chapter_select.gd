extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$"HBoxContainer/Chapter 1".grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_chapter_1_pressed():
	get_tree().change_scene_to_file("res://scenes/chapters/chapter1.tscn")
	pass # Replace with function body.


func _on_chapter_2_pressed():
	get_tree().change_scene_to_file("res://scenes/chapters/chapter1.tscn")
	pass # Replace with function body.


func _on_chapter_3_pressed():
	get_tree().change_scene_to_file("res://scenes/chapters/chapter1.tscn")
	pass # Replace with function body.
