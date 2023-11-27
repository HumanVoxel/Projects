extends CanvasLayer

@onready var total_deaths = PlayerStats.total_deaths
@onready var total_doses = PlayerStats.total_doses
@onready var collectibles = PlayerStats.collectibles

# Called when the node enters the scene tree for the first time.
func _ready():
#	$paper/RichTextLabel.grab_focus()
	var paper_sound = AudioBus.play_sound_2d(AudioBus.PAPER_OPEN)
	add_child(paper_sound)
	paper_sound.play()
	get_tree().paused = true
	var text = "Total Deaths = %d\n
	Total Collectibles = %d\n
	Total Vaccine Doses = %d\n
	Chapter 1 Completion Time = %s\n
	Chapter 2 Completion Time = %s\n
	Chapter 3 Completion Time = %s\n
	TotalTotal Playtime = %s"
	$paper/MarginContainer/Label.text = text % [total_deaths, 
	PlayerStats.collectibles.size(),
	total_doses,
	PlayerStats.get_total_playtime("Chapter1"),
	PlayerStats.get_total_playtime("Chapter2"),
	PlayerStats.get_total_playtime("Chapter3"),
	PlayerStats.get_total_playtime("Total")]
	pass # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = false
		$AnimationPlayer.play("close")
		var paper_sound = AudioBus.play_sound_2d(AudioBus.PAPER_OPEN)
		add_child(paper_sound)
		paper_sound.play()
		await $AnimationPlayer.animation_finished
		queue_free()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

