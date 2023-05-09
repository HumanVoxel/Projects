extends CanvasLayer

@onready var chapters_unlocked : Array[String] = PlayerStats.chapters_unlocked
@export var chapter_1 : NodePath
@export var chapter_2 : NodePath
@export var chapter_3 : NodePath
@onready var chapter_1_node : TextureButton = get_node(chapter_1)
@onready var chapter_2_node : TextureButton = get_node(chapter_2)
@onready var chapter_3_node : TextureButton = get_node(chapter_3)
# Called when the node enters the scene tree for the first time.
func _ready():
	chapter_1_node.grab_focus()
	for chapter in chapters_unlocked:
		match chapter:
			"Chapter1":
				chapter_1_node.disabled = false
			"Chapter2":
				chapter_2_node.disabled = false
			"Chapter3":
				chapter_3_node.disabled = false
	chapter_1_node.focus_neighbor_right = chapter_2
	chapter_2_node.focus_neighbor_left = chapter_1
	chapter_2_node.focus_neighbor_right = chapter_3
	chapter_3_node.focus_neighbor_left = chapter_2

	pass # Replace with function body.



func _on_chapter_1_select_pressed():
	get_tree().change_scene_to_file("res://scenes/chapters/chapter_1.tscn")
	pass # Replace with function body.


func _on_chapter_2_select_pressed():
	get_tree().change_scene_to_file("res://scenes/chapters/chapter_2.tscn")
	pass # Replace with function body.


func _on_chapter_3_select_pressed():
	get_tree().change_scene_to_file("res://scenes/chapters/chapter_3.tscn")
	pass # Replace with function body.
