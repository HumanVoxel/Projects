extends Node

signal player_damaged(damage : float)

# Called when the node enters the scene tree for the first time.
func _ready():
	player_damaged.connect(_on_player_damaged)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_damaged(damage : float):
	print('player damaged')
