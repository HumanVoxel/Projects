extends AnimatableBody2D

#@export var platform : Node
@export var timelapse : float
#@export var path2d_external : Path2D
@onready var collision_shape_2d = $CollisionShape2D

func _ready():
#	platform.reparent($PathFollow2D)
#	$Path2D/PathFollow2D.add_child(platform)
#	$Path2D.curve = path2d_external.curve
#	path2d_external.queue_free()
	if timelapse:
		$AnimationPlayer.speed_scale = $AnimationPlayer.speed_scale/timelapse
	pass # Replace with function body.
