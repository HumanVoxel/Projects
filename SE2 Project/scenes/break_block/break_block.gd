extends StaticBody2D

var player : CharacterBody2D
@export var regen_time : float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_player_detector_body_entered(body):
	if body.name == "Player":
		player = body
		$AnimationPlayer.play("break")
		await $AnimationPlayer.animation_finished
		await get_tree().create_timer(regen_time).timeout
		$AnimationPlayer.play("RESET")
	pass # Replace with function body.


func _on_player_detector_body_exited(body):
	if body.name == "Player":
		player = null
	pass # Replace with function body.
