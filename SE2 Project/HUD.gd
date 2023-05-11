extends CanvasLayer


var max_health : float
var health : float
var collectibles : Array


@onready var healthbar = $Control/healthbar
@onready var healthtext = $Control/healthtext
@onready var facemask = $Control/HBoxContainer2/facemask
@onready var dose1 = $Control/HBoxContainer2/dose1
@onready var dose2 = $Control/HBoxContainer2/dose2
@onready var booster = $Control/HBoxContainer2/booster


# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerStats.player_collected.connect(player_collected)
	PlayerStats.health_increased.connect(player_health_increased)
	health = PlayerStats.max_health
	max_health = PlayerStats.max_health
	update()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update():
	collectibles = PlayerStats.collectibles
	healthbar.value = health
	max_health = PlayerStats.max_health
	healthbar.max_value = max_health
	healthtext.text = "%s/%s" % [health,max_health]
	
	for col in collectibles:
		if col == "facemask":
			facemask.show()
		elif col == "dose1":
			dose1.show()
		elif col == "dose2":
			dose2.show()
		elif col == "booster":
			booster.show()
	

func _on_player_damaged(health, damage):
	self.health = health
	update()
	pass # Replace with function body.

func player_collected(collectible):
	if (collectible == "facemask") || (collectible == "dose1") || (collectible == "dose2") || (collectible == "booster"):
		health = PlayerStats.compute_max_health()
	update()
	
func player_health_increased(health):
#	self.health = health
#	update()
	pass
