extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		body.is_dash_ready = true
		$AnimationPlayer.play("collect")
		await get_tree().create_timer(3).timeout
		self._ready()
	pass # Replace with function body.
