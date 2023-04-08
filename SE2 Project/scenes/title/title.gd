extends Control


signal change_scene(to: String)


func _on_start_pressed() -> void:
	change_scene.emit("res://scenes/chapter_select/chapter_select.tscn")
#	change_scene.emit("res://game_level.tscn")
	pass


func _on_load_pressed() -> void:
	SaveLoad.show_save_load()


func _on_options_pressed() -> void:
	Options.show_options()


func _on_change_scene(to):
	pass # Replace with function body.
