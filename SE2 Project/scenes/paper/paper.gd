extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
#	$paper/MarginContainer/ScrollContainer/VBoxContainer/RichTextLabel.grab_focus()
	var paper_sound = AudioBus.play_sound_2d(AudioBus.PAPER_OPEN)
	add_child(paper_sound)
	paper_sound.play()
	get_tree().paused = true
	pass # Replace with function body.

func _unhandled_input(event):
	pass
	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		$paper/MarginContainer/ScrollContainer.scroll_vertical -= 5
	if Input.is_action_pressed("ui_down"):
		$paper/MarginContainer/ScrollContainer.scroll_vertical += 5
	if Input.is_action_pressed("pause") or Input.is_action_just_pressed("ui_accept"):
		$AnimationPlayer.play("close")
		var paper_sound = AudioBus.play_sound_2d(AudioBus.PAPER_OPEN)
		add_child(paper_sound)
		paper_sound.play()
		await $AnimationPlayer.animation_finished
		get_tree().paused = false
		get_parent().queue_free()
	pass

