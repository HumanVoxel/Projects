extends Node2D

@export var spring_force : float
@onready var direction : Vector2 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		body.velocity = direction * -300
		print(direction)
		$AnimationPlayer.play("decompress")
	pass # Replace with function body.
