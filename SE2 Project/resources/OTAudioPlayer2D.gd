class_name OTAudioPlayer2D
extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready():
	finished.connect(exit)
	pass # Replace with function body.

func exit():
	queue_free()
