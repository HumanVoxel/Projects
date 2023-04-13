extends Area2D

@export_file("*.tscn") var ui_resource : String
@export_file("*.tscn") var chapter_resource : String
var scene

# Called when the node enters the scene tree for the first time.
func _ready():
	if ui_resource:
		scene = load(ui_resource)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		if scene:
			var new_scene = scene.instantiate()
			add_child(new_scene)
			new_scene.next_chapter_resource = chapter_resource
	pass # Replace with function body.
