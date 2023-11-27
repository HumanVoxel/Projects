extends CanvasLayer

var next_chapter_resource : String

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	if PlayerStats.current_chapter == "Chapter1":
		PlayerStats.chapter_1_completion_time = PlayerStats.chapter_1_run_time
		$"ColorRect/VBoxContainer/Completion Time".text = PlayerStats.get_total_playtime("Chapter1")
	elif PlayerStats.current_chapter == "Chapter2":
		PlayerStats.chapter_2_completion_time = PlayerStats.chapter_2_run_time
		$"ColorRect/VBoxContainer/Completion Time".text = PlayerStats.get_total_playtime("Chapter2")
	elif PlayerStats.current_chapter == "Chapter3":
		PlayerStats.chapter_3_completion_time = PlayerStats.chapter_3_run_time
		$"ColorRect/VBoxContainer/Completion Time".text = PlayerStats.get_total_playtime("Chapter3")

	$"ColorRect/VBoxContainer/Next Chapter".grab_focus()
	AudioBus.play_global_music(AudioBus.CHAPTER1_CLEAR)
	pass # Replace with function body.


func _on_next_chapter_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file(next_chapter_resource)
	pass # Replace with function body.

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main menu/main_menu.tscn")
	pass # Replace with function body.
