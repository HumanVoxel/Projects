extends Area2D

var camera_2d

@export var zoom : Vector2
@export var collision_shape : CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if collision_shape:
		$CollisionShape2D.transform = collision_shape.transform
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		camera_2d = Camera2D.new()
		camera_2d.enabled = true
		if zoom:
			camera_2d.zoom = zoom
		add_child(camera_2d)
		if camera_2d.is_current() == false:
			camera_2d.make_current()
		camera_2d.global_position = global_position
		
		
		
#		print($CollisionShape2D.shape.get_rect().size)
#		camera_2d.limit_top = $CollisionShape2D.shape.get_rect().position.y
#		camera_2d.limit_bottom = camera_2d.limit_top + $CollisionShape2D.shape.get_rect().size.y
#		camera_2d.limit_left = -$CollisionShape2D.shape.get_rect().aposition.x
#		camera_2d.limit_right = camera_2d.limit_left + $CollisionShape2D.shape.get_rect().size.x
		
		print("cameraswitched")
	pass # Replace with function body.


func _on_body_exited(body):
	if body.name == "Player":
		camera_2d.queue_free()
	pass # Replace with function body.
