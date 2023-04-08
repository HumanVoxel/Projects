extends Node2D


var velocity : Vector2
var previous_position : Vector2
@onready var animatable_body : AnimatableBody2D = $AnimatableBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	previous_position = $AnimatableBody2D.global_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if previous_position != $AnimatableBody2D.global_position:
		velocity = $AnimatableBody2D.global_position - previous_position
#		animatable_body.constant_linear_velocity = velocity
		previous_position = $AnimatableBody2D.global_position
#		print(velocity)
