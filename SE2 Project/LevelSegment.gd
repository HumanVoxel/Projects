extends Area2D

@export var camera_node : Camera2D
@export var collision_shape : CollisionShape2D
@onready var collision_shape_internal : CollisionShape2D = $CollisionShape2D
@export var zoom : Vector2 = Vector2.ZERO
@export var limit_left : int = -10000000
@export var limit_top : int = -10000000
@export var limit_right : int = 10000000
@export var limit_bottom : int = 10000000



# Called when the node enters the scene tree for the first time.
func _ready():
#	collision_shape.reparent(self)
#	if collision_shape:
#		collision_shape_internal.transform = collision_shape.transform
#		collision_shape.queue_free()
#		print("trasnformed")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.name == "Player":
		var camera_node = body.camera
		if zoom:
			camera_node.zoom = zoom
		camera_node.set_limit(SIDE_LEFT, limit_left)
		camera_node.set_limit(SIDE_TOP, limit_top)
		camera_node.set_limit(SIDE_RIGHT, limit_right)
		camera_node.set_limit(SIDE_BOTTOM, limit_bottom)
		
		print("cameraswitched")
	pass # Replace with function body.


func _on_body_exited(body):
#	if body.name == "Player":
#		body.camera_2d.queue_free()
	pass # Replace with function body.
