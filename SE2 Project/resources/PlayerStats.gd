extends Node

signal player_collected
signal health_increased

var total_deaths : int = 0
var collectibles : Array = []
var total_playtime : int
var max_health : float = 10
var total_doses : float = 0
var chapters_unlocked : Array[String] = ["Chapter1"]
var just_got_vaccinated : bool = false
var intro_done : bool = false
var is_wearing_mask : bool = false

var dose1collected : bool
var dose2collected : bool
var boostercollected : bool

var start_time = 0
var total_time = 0
var global_time_running = false

var is_dialogue_visible = false
var current_chapter : String
var chapter_1_completion_time : float = 0
var chapter_2_completion_time : float  = 0
var chapter_3_completion_time : float = 0
var chapter_1_run_time : float = 0
var chapter_2_run_time : float  = 0
var chapter_3_run_time : float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	start_timer()
#	start_time = Time.get_ticks_usec()
	compute_max_health()
	pass # Replace with function body.

func compute_max_health() -> float:
	max_health = 10
	total_doses = 0
	for col in collectibles:
		if col == "facemask" and is_wearing_mask:
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
		AudioBus.play_sound_fx(AudioBus.HEALTH_UP)
	if collectible == "dose1":
		dose1collected = true
	elif collectible == "dose2":
		dose2collected = true
	elif collectible == "booster":
		boostercollected = true


func _physics_process(delta):
	if global_time_running:
		total_time += delta
	
	if is_dialogue_visible == false:
		if current_chapter == "Chapter1":
			chapter_1_run_time += delta
		elif current_chapter == "Chapter2":
			chapter_2_run_time += delta
		elif current_chapter == "Chapter3":
			chapter_3_run_time += delta

func start_timer():
	global_time_running = true

func stop_timer():
	global_time_running = false

func reset_timer():
	global_time_running = false
	total_time = 0

func get_total_playtime(chapter : String):
	var time

	if chapter == "Chapter1":
		time = chapter_1_completion_time
	elif chapter == "Chapter2":
		time = chapter_2_completion_time
	elif chapter == "Chapter3":
		time = chapter_3_completion_time
	elif chapter == "Total":
		time = total_time
		
	return time_convert(time)
	
func get_run_playtime(chapter : String):
	var time

	if chapter == "Chapter1":
		time = chapter_1_run_time
	elif chapter == "Chapter2":
		time = chapter_2_run_time
	elif chapter == "Chapter3":
		time = chapter_3_run_time
	else:
		time = total_time
		
	return time_convert(time)
	
func time_convert(time : float):
	var total_seconds = time
	var hours = int(total_seconds / 3600)
	var minutes = int((total_seconds - hours * 3600) / 60)
	var seconds = int(total_seconds - hours * 3600 - minutes * 60)
	var microseconds = int((total_seconds - int(total_seconds)) * 1e2)
	return "%02d:%02d:%02d.%02d" % [hours, minutes, seconds, microseconds]
	
	
	
	
