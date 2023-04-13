class_name Player
extends CharacterBody2D

signal damaged
signal gameOver
signal collected

@onready var health = PlayerStats.max_health
var is_dash_ready : bool
var wall_direction : Vector2
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var  is_indoors : bool = false

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")
@onready var animation_player = $AnimationPlayer
@onready var states = $state_manager
@onready var face_direction : int = 1
@onready var original_parent = get_parent()


func _ready() -> void:
	collected.connect(PlayerStats.collectibles_append)
	PlayerStats.health_increased.connect(player_health_increased)
	if "facemask" in PlayerStats.collectibles:
		$Sprite2D.texture = load("res://Assets/character/character_sheet_masked.png")
	states.init()

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	if is_on_wall():
		wall_direction = -get_wall_normal()
			
	update_animation_parameters()
	states.physics_process(delta)
		
func _process(delta: float) -> void:
	states.process(delta)

func update_animation_parameters() -> void:
	animation_tree.set("parameters/climb/blend_position", Vector2(wall_direction.x, velocity.y))
	animation_tree.set("parameters/dash/blend_position", velocity.x)
	animation_tree.set("parameters/fall/blend_position", (face_direction if velocity.x == 0 else velocity.x))
	animation_tree.set("parameters/jump/blend_position", (face_direction if velocity.x == 0 else velocity.x))
	animation_tree.set("parameters/walk/blend_position", velocity.x)
	pass
	

func player_damaged(damage : float) -> void:
	health -= damage
	emit_signal("damaged", health, damage)
	if health <= 0:
		PlayerStats.total_deaths += 1
		emit_signal("gameOver")
	print(health)
	pass
	
func player_collected(collectible):
	emit_signal("collected", collectible)
	if collectible == "facemask":
		$Sprite2D.texture = load("res://Assets/character/character_sheet_masked.png")

func player_health_increased(health):
	self.health = health
