extends Node

var total_deaths : int
var doses : Array = []
var collectibles : Array = ["facemask","dose1","dose2","booster"]
var total_playtime : int
var max_health : float

# Called when the node enters the scene tree for the first time.
func _ready():
	compute_max_health()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func compute_max_health() -> float:
	max_health = 0
	for col in collectibles:
		if col == "facemask":
			max_health += 10
		elif col == "dose1":
			max_health += 25
		elif col == "dose2":
			max_health += 35
		elif col == "booster":
			max_health += 30
	return max_health
