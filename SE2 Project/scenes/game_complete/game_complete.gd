extends CanvasLayer


@onready var total_deaths = PlayerStats.total_deaths
@onready var total_doses = PlayerStats.total_doses
@onready var collectibles = PlayerStats.collectibles

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	PlayerStats.chapter_3_completion_time = PlayerStats.chapter_3_run_time
	
	var text_left = "Total Deaths = %d\n
	Total Collectibles = %d\n
	Total Vaccine Doses = %d\n"
	
	$"ColorRect/VBoxContainer/HBoxContainer/Stats Left".text = text_left % [total_deaths, 
	PlayerStats.collectibles.size(),
	total_doses]
	
	var text_right = "Chapter 1 Completion Time = %s\n
	Chapter 2 Completion Time = %s\n
	Chapter 3 Completion Time = %s\n
	Total Playtime = %s"
	
	$"ColorRect/VBoxContainer/HBoxContainer/Stats Right".text = text_right % [PlayerStats.get_total_playtime("Chapter1"),
	PlayerStats.get_total_playtime("Chapter2"),
	PlayerStats.get_total_playtime("Chapter3"),
	PlayerStats.get_total_playtime("Total")]
	
	$"ColorRect/VBoxContainer/Main Menu".grab_focus()
	pass # Replace with function body.


func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main menu/main_menu.tscn")
	pass # Replace with function body.
