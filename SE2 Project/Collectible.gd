extends Node2D


@export_file("*.tscn") var resource : String
var scene
var new_scene
@export var collectible_sprite : Texture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$collectible_sprite.texture = collectible_sprite
	if resource:
		scene = load(resource)
	pass # Replace with function body.

func _on_player_detector_body_entered(body):
	if body.name == "Player":
		body.player_collected(name)
		$AnimationPlayer.play("collected")
		await $AnimationPlayer.animation_finished
		if scene:
			new_scene = scene.instantiate()
			add_child(new_scene)
		await new_scene.tree_exited
		queue_free()
	pass # Replace with function body.
