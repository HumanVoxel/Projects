extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$"VBoxContainer/Start Game".grab_focus()
	AudioBus.play_global_music(AudioBus.AIRLINES)
	PlayerStats.current_chapter = ""
	pass # Replace with function body.

func _process(delta):
	if $"Fullscreen Button".has_focus():
		$ColorRect.show()
	else:
		$ColorRect.hide()
	
	
func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://scenes/chapter_select/chapter_select.tscn")
	pass # Replace with function body.

func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://scenes/tutorial/tutorial.tscn")
	pass # Replace with function body.

func _on_player_stats_button_up():
	add_child(preload("res://scenes/player_stats/player_stats.tscn").instantiate())
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.








func _on_fullscreen_button_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		print("windowed")
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
#		DisplayServer.window_set_max_size(Vector2i(1920,1080))
	pass # Replace with function body.
