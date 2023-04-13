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
	if event.is_action_pressed("pause"):
		get_tree().paused = false
		$AnimationPlayer.play("close")
		var paper_sound = AudioBus.play_sound_2d(AudioBus.PAPER_OPEN)
		add_child(paper_sound)
		paper_sound.play()
		await $AnimationPlayer.animation_finished
		get_parent().queue_free()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

