extends CanvasLayer


@onready var total_deaths = PlayerStats.total_deaths
@onready var total_doses = PlayerStats.total_doses
@onready var collectibles = PlayerStats.collectibles

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	var text = "Total Deaths = %d\nTotal Vaccine Doses = %d"
	$ColorRect/VBoxContainer/Stats.text = text % [total_deaths, total_doses]
	$"ColorRect/VBoxContainer/Main Menu".grab_focus()
	pass # Replace with function body.


func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main menu/main_menu.tscn")
	pass # Replace with function body.
