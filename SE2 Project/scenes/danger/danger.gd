extends CanvasLayer

@onready var player : Player = get_parent().get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("transition_show")
	$AnimationPlayer2.play("transition_show")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("transition_hide")
	await $AnimationPlayer.animation_finished
	queue_free()
	pass # Replace with function body.



