extends Node

signal player_collected
signal health_increased

var total_deaths : int = 0
var collectibles : Array = []
var total_playtime : int
var max_health : float = 10
var total_doses : float = 0
var chapters_unlocked : Array[String] = ["Chapter1","Chapter2"]
var just_got_vaccinated : bool = false
var intro_done : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	compute_max_health()
	pass # Replace with function body.

func compute_max_health() -> float:
	max_health = 10
	total_doses = 0
	for col in collectibles:
		if col == "facemask":
			max_health += 10
		elif col == "dose1":
			max_health += 30
			total_doses += 1
		elif col == "dose2":
			max_health += 30
			total_doses += 1
		elif col == "booster":
			max_health += 20
			total_doses += 1
	return max_health

func collectibles_append(collectible : String) -> void:
	collectibles.append(collectible)
	emit_signal("player_collected", collectible)
	if (collectible == "facemask") || (collectible == "dose1") || (collectible == "dose2") || (collectible == "booster"):
		emit_signal("health_increased", compute_max_health())
