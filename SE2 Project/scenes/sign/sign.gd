extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
#	$paper/MarginContainer/ScrollContainer/VBoxContainer/RichTextLabel.grab_focus()
#	var paper_sound = AudioBus.play_sound_2d(AudioBus.PAPER_OPEN)
#	add_child(paper_sound)
#	paper_sound.play()
	get_tree().paused = true
	pass # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed("pause") or event.is_action_pressed("ui_accept"):
		$AnimationPlayer.play("hide")
#		var paper_sound = AudioBus.play_sound_2d(AudioBus.PAPER_OPEN)
#		add_child(paper_sound)
#		paper_sound.play()
		await $AnimationPlayer.animation_finished
		get_tree().paused = false
		queue_free()
	pass
	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		$sign/MarginContainer/ScrollContainer.scroll_vertical -= 5
	if Input.is_action_pressed("ui_down"):
		$sign/MarginContainer/ScrollContainer.scroll_vertical += 5
	
	pass

