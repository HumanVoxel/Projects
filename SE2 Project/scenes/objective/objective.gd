extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
#	$paper/MarginContainer/ScrollContainer/VBoxContainer/RichTextLabel.grab_focus()
	AudioBus.play_sound_ambient(AudioBus.WHISTLE)
	get_tree().paused = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$AnimationPlayer.play("fade_out")
		await $AnimationPlayer.animation_finished
		get_tree().paused = false
		queue_free()
	pass

