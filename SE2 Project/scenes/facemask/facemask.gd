extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
#	var facemask_paper_node = preload("res://scenes/paper/facemask_paper.tscn")
#	add_child(facemask_paper_node.instantiate())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	queue_free()
	pass # Replace with function body.
