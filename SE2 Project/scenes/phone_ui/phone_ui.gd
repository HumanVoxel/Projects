extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
#	$MarginContainer/TextureRect/ScrollContainer/VBoxContainer/Label.grab_focus()
	$TextureRect/ScrollContainer.grab_focus()
	get_tree().paused = true
	pass # Replace with function body.

func _unhandled_input(event):
	pass
	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		$TextureRect/ScrollContainer.scroll_vertical -= 5
	if Input.is_action_pressed("ui_down"):
		$TextureRect/ScrollContainer.scroll_vertical += 5
	if Input.is_action_pressed("pause") or Input.is_action_just_pressed("ui_accept"):
		$AnimationPlayer.play("close")
		await $AnimationPlayer.animation_finished
		get_tree().paused = false
		queue_free()
#		get_parent().queue_free()
	pass

