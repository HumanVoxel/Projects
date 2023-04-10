extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Play.grab_focus()
	AudioBus.play_global_music(AudioBus.AIRLINES)
	pass # Replace with function body.


func _on_player_stats_button_up():
	add_child(preload("res://scenes/player_stats/player_stats.tscn").instantiate())
	pass # Replace with function body.


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/chapter_select/chapter_select.tscn")
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
