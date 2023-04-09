extends Node2D


@export_file("*.tscn") var paper_resource : String
@onready var paper_scene = load(paper_resource)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_player_detector_body_entered(body):
	if body.name == "Player":
		body.player_collected(self.name as String)
		$AnimationPlayer.play("collected")
		await $AnimationPlayer.animation_finished
		add_child(paper_scene.instantiate())
	pass # Replace with function body.
