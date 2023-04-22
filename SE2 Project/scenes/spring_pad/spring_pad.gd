extends Node2D

@export var spring_force : float = 300 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite2D.play("default")
		body.states.change_state(body.states.jump_state)
		body.is_dash_ready = true
		body.velocity = global_position.direction_to($Marker2D.global_position) * spring_force
	pass # Replace with function body.
