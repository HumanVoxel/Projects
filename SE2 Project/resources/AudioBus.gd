extends Node


const JUMP = preload("res://resources/sounds/sfx/Jump.wav")
const DASH = preload("res://resources/sounds/sfx/zapsplat_foley_stick_branch_medium_sized_swing_whoosh_swoosh_through_air_003_90354.mp3")
const CLIMB = preload("res://resources/sounds/sfx/42_Cling_climb_03.wav")
const PLAYER_HIT = preload("res://resources/sounds/sfx/playerhit-43108.mp3")
const GROUNDED = preload("res://resources/sounds/sfx/42_Cling_climb_03.wav")


const CHANGE_FOCUS = preload("res://resources/sounds/sfx/Select.wav")
const BOOK_OPEN = preload("res://resources/sounds/sfx/zapsplat_foley_newspaper_broadsheet_folded_set_down_002_85408.mp3")
const BOOK_CLOSE = preload("res://resources/sounds/sfx/zapsplat_household_book_paperback_thin_set_down_002_48768.mp3")
const PAPER_OPEN = preload("res://resources/sounds/sfx/zapsplat_foley_newspaper_pick_up_from_table_or_surface_002_85459.mp3")
const PAPER_CLOSE = preload("res://resources/sounds/sfx/zapsplat_foley_newspaper_pick_up_from_table_or_surface_001_85458.mp3")


const BIT_SAMPLE = preload("res://resources/sounds/music/8bit-sample-69080.mp3")
const AIRLINES = preload("res://resources/sounds/music/happy-airlines-ym-2413-28411.mp3")
const VERYLUSH = preload("res://resources/sounds/music/very-lush-and-swag-loop-74140.mp3")

const HEALTH_CENTRE = preload("res://resources/sounds/ambiance/conveniencestorering-96090.mp3")
const CONVENIENCE_STORE = preload("res://resources/sounds/ambiance/conveniencestorering-96090.mp3")

const GAME_OVER = preload("res://resources/sounds/sfx/videogame-death-sound-43894.mp3")
const SPLAT = preload("res://resources/sounds/sfx/SPLAT Crush 01.wav")

@onready var global_music : AudioStreamPlayer = AudioStreamPlayer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	global_music.bus = "Music"
	add_child(global_music)
	pass # Replace with function body.


func play_sound(sound):
	var audioStreamPlayer = OTAudioPlayer.new()
	audioStreamPlayer.name = sound.resource_path.get_file().trim_suffix('.tres')
	audioStreamPlayer.stream = sound as AudioStream
	audioStreamPlayer.bus = "AmbientSounds"
	add_child(audioStreamPlayer)
	audioStreamPlayer.play()
	await audioStreamPlayer.finished
	audioStreamPlayer.queue_free()
	
func play_sound_2d(sound) -> OTAudioPlayer2D:
	var audioStreamPlayer2D = OTAudioPlayer2D.new()
	audioStreamPlayer2D.name = sound.resource_path.get_file().trim_suffix('.tres')
	audioStreamPlayer2D.stream = sound as AudioStream
	audioStreamPlayer2D.bus = "SoundEffects"
	return audioStreamPlayer2D
	
func play_global_music(sound):
	global_music.stream = sound as AudioStream
	global_music.play()
	
	

