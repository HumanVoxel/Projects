extends CanvasLayer

@onready var chapters_unlocked : Array[String] = PlayerStats.chapters_unlocked
# Called when the node enters the scene tree for the first time.
func _ready():
	$"HBoxContainer/Chapter 1".grab_focus()
	for chapter in chapters_unlocked:
		match chapter:
			"Chapter1":
				$"HBoxContainer/Chapter 1".disabled = false
			"Chapter2":
				$"HBoxContainer/Chapter 2".disabled = false
			"Chapter3":
				$"HBoxContainer/Chapter 3".disabled = false
	pass # Replace with function body.



func _on_chapter_1_pressed():
	get_tree().change_scene_to_file("res://scenes/chapters/chapter_1.tscn")
	pass # Replace with function body.


func _on_chapter_2_pressed():
	get_tree().change_scene_to_file("res://scenes/chapters/chapter_2.tscn")
	pass # Replace with function body.


func _on_chapter_3_pressed():
	get_tree().change_scene_to_file("res://scenes/chapters/chapter_3.tscn")
	pass # Replace with function body.
