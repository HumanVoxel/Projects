extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$paper/MarginContainer/RichTextLabel.grab_focus()
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("pause"):
		var new_paused_state = not get_tree().paused
		get_tree().paused = new_paused_state
		visible = new_paused_state
		$AnimationPlayer.play("close")
		await $AnimationPlayer.animation_finished
		queue_free()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
