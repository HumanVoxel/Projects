extends Area2D

var camera_2d

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		camera_2d = Camera2D.new()
		add_child(camera_2d)
		camera_2d.enabled = true
		if camera_2d.is_current() == false:
			camera_2d.make_current()
		camera_2d.global_transform = self.global_transform
		
		print("cameraswitched")
	pass # Replace with function body.


func _on_body_exited(body):
	if body.name == "Player":
		camera_2d.queue_free()
	pass # Replace with function body.
