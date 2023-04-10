extends Node2D

var player_in_area : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed("ui_up"):
		pass

func _on_entrance_body_entered(body):
	if body.name == "Player":
		$health_centre_sprite/Door2WideOpen.show()
		player_in_area = true
		var health_centre_sound = AudioBus.play_sound_2d(AudioBus.HEALTH_CENTRE)
		add_child(health_centre_sound)
		health_centre_sound.play()
	pass # Replace with function body.


func _on_entrance_body_exited(body):
	if body.name == "Player":
		$health_centre_sprite/Door2WideOpen.hide()
		player_in_area = false
	pass # Replace with function body.
