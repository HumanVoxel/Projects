extends CanvasLayer

@onready var total_deaths = PlayerStats.total_deaths
@onready var total_doses = PlayerStats.total_doses
@onready var collectibles = PlayerStats.collectibles

# Called when the node enters the scene tree for the first time.
func _ready():
	$paper/MarginContainer/RichTextLabel.grab_focus()
	var paper_sound = AudioBus.play_sound_2d(AudioBus.PAPER_OPEN)
	add_child(paper_sound)
	paper_sound.play()
	get_tree().paused = true
	var text = "[center]Total Deaths = %d\nTotal Vaccine Doses = %d"
	$paper/MarginContainer/RichTextLabel.text = text % [total_deaths, total_doses]
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
