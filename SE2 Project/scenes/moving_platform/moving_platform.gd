extends Path2D

@export var timelapse : float
# Called when the node enters the scene tree for the first time.
func _ready():
	if timelapse:
		$AnimationPlayer.speed_scale = $AnimationPlayer.speed_scale/timelapse
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
