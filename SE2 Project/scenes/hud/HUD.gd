extends CanvasLayer

var max_health : float = PlayerStats.player_max_health
var health : float = PlayerStats.player_health
var doses : Array = PlayerStats.doses
var has_facemask : bool = PlayerStats.has_facemask

@onready var healthbar = $HBoxContainer/healthbar

# Called when the node enters the scene tree for the first time.
func _ready():
	healthbar.value = health
	healthbar.max_value = max_health
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
