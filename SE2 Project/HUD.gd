extends CanvasLayer


@onready var max_health : float = PlayerStats.max_health
@onready var health : float = max_health
@onready var doses : Array = PlayerStats.doses
@onready var collectibles : Array = PlayerStats.collectibles


@onready var healthbar = $Control/HBoxContainer/healthbar
@onready var healthtext = $Control/HBoxContainer/healthtext
@onready var facemask = $Control/HBoxContainer2/facemask
@onready var dose1 = $Control/HBoxContainer2/dose1
@onready var dose2 = $Control/HBoxContainer2/dose2
@onready var booster = $Control/HBoxContainer2/booster


# Called when the node enters the scene tree for the first time.
func _ready():
	update()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update():
	for col in collectibles:
		if col == "facemask":
			facemask.show()
		elif col == "dose1":
			dose1.show()
		elif col == "dose2":
			dose2.show()
		elif col == "booster":
			booster.show()
			
	healthtext.text = "%s/%s" % [health,max_health]
	healthbar.value = health
	healthbar.max_value = PlayerStats.compute_max_health()


func _on_player_damaged(health, damage):
	self.health = health
	update()
	pass # Replace with function body.
