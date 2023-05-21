extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
#	var game_over_sound = AudioBus.play_sound_2d(AudioBus.GAME_OVER)
#	add_child(game_over_sound)
#	game_over_sound.play()
	AudioBus.play_sound_ambient(AudioBus.GAME_OVER)
	AudioBus.play_sound_ambient(AudioBus.SPLAT)
	AudioBus.play_global_music(AudioBus.GAME_OVER_MUSIC)
	get_tree().paused = true
	$VBoxContainer/Restart.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_game_over():
	pass # Replace with function body.


func _on_restart_button_up():
	get_tree().paused = false
	get_tree().reload_current_scene()
	pass # Replace with function body.

func _on_main_menu_button_up():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main menu/main_menu.tscn")
	pass # Replace with function body.
