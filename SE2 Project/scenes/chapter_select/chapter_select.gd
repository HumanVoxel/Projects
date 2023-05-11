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
				$Padlock.hide()
			"Chapter2":
				chapter_2_node.disabled = false
				$Padlock2.hide()
			"Chapter3":
				chapter_3_node.disabled = false
				$Padlock3.hide()
#	chapter_1_node.focus_neighbor_right = chapter_2
#	chapter_2_node.focus_neighbor_left = chapter_1
#	chapter_2_node.focus_neighbor_right = chapter_3
#	chapter_3_node.focus_neighbor_left = chapter_2

	pass # Replace with function body.

func _process(delta):
	if $MarginContainer1/Chapter1Select.has_focus():
		$MarginContainer1/Chapter1Select.modulate = Color(.9,.9,.9,1)
		$ColorRect.color = Color("bca242")
	else:
		$MarginContainer1/Chapter1Select.modulate = Color(.5,.5,.5,1)
		$ColorRect.color = Color("282828")
		
	if $MarginContainer2/Chapter2Select.has_focus():
		$MarginContainer2/Chapter2Select.modulate = Color(.9,.9,.9,1)
		$ColorRect2.color = Color("bca242")
	else:
		$MarginContainer2/Chapter2Select.modulate = Color(.5,.5,.5,1)
		$ColorRect2.color = Color("282828")
		
	if $MarginContainer3/Chapter3Select.has_focus():
		$MarginContainer3/Chapter3Select.modulate = Color(.9,.9,.9,1)
		$ColorRect3.color = Color("bca242")
	else:
		$MarginContainer3/Chapter3Select.modulate = Color(.5,.5,.5,1)
		$ColorRect3.color = Color("282828")
	

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		get_tree().change_scene_to_file("res://scenes/main menu/main_menu.tscn")
		
func _on_chapter_1_select_pressed():
	get_tree().change_scene_to_file("res://scenes/chapters/chapter_1.tscn")
	pass # Replace with function body.


func _on_chapter_2_select_pressed():
	get_tree().change_scene_to_file("res://scenes/chapters/chapter_2.tscn")
	pass # Replace with function body.


func _on_chapter_3_select_pressed():
	get_tree().change_scene_to_file("res://scenes/chapters/chapter_3.tscn")
	pass # Replace with function body.


func _on_chapter_1_select_mouse_entered():
	if not $MarginContainer1/Chapter1Select.disabled:
		$MarginContainer1/Chapter1Select.modulate = Color(.9,.9,.9,1)
	pass # Replace with function body.


func _on_chapter_1_select_mouse_exited():
	if not $MarginContainer1/Chapter1Select.disabled:
		$MarginContainer1/Chapter1Select.modulate = Color(.5,.5,.5,1)
	pass # Replace with function body.


func _on_chapter_2_select_mouse_entered():
	if not $MarginContainer2/Chapter2Select.disabled:
		$MarginContainer2/Chapter2Select.modulate = Color(.9,.9,.9,1)
	pass # Replace with function body.


func _on_chapter_2_select_mouse_exited():
	if not $MarginContainer2/Chapter2Select.disabled:
		$MarginContainer2/Chapter2Select.modulate = Color(.5,.5,.5,1)
	pass # Replace with function body.


func _on_chapter_3_select_mouse_entered():
	if not $MarginContainer3/Chapter3Select.disabled:
		$MarginContainer3/Chapter3Select.modulate = Color(.9,.9,.9,1)
	pass # Replace with function body.


func _on_chapter_3_select_mouse_exited():
	if not $MarginContainer3/Chapter3Select.disabled:
		$MarginContainer3/Chapter3Select.modulate = Color(.5,.5,.5,1)
	pass # Replace with function body.
