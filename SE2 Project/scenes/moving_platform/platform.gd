extends AnimatableBody2D

@export var collision_polygon_2d : CollisionPolygon2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_child_entered_tree(node):
	if node.name == "Player" and not get_parent().auto_move:
		print("playermovingplatform")
		$"../AnimationPlayer".play(get_parent().animation)
		pass
	pass # Replace with function body.
