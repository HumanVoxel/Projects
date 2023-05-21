class_name Virus
extends CharacterBody2D


@export var path_to_player : NodePath

@onready var player : Player = get_parent().get_node("Player")
var player_initial_pos : Vector2
#@onready var agent = $NavigationAgent2D
#@export var SPEED = 200.0
@export var attack_damage = 10.0
@export var grace_period : float = 1
var navigation_points : Array = []
var seek_player : bool = false
var active : bool = false

func _ready() -> void:
	$player_collision_detector/CollisionShape2D.set_deferred("disabled", true)
#	player_initial_pos = player.global_position
#
##	navigation_points.append(player.global_position)
##	global_position = navigation_points.front()
	pass
	
func _physics_process(delta):
	if player.global_position != player_initial_pos and not active and not player.is_indoors:
		active = true
		global_position = player.global_position
		$AnimationPlayer.play("blink")
		await get_tree().create_timer(grace_period).timeout
		$player_collision_detector/CollisionShape2D.set_deferred("disabled", false)
		$caution.queue_free()
		$AnimationPlayer.queue_free()
		$AnimatedSprite2D.show()
		seek_player = true

	if active and not player.is_indoors:
		var new_position = player.global_position
		navigation_points.append(new_position)
		if seek_player:
			update_position()
	pass


func _on_player_collision_detector_body_entered(body):
	if body.name == "Player" and active:
		body.player_damaged(attack_damage)
		$player_collision_detector/CollisionShape2D.set_deferred("disabled", true)
#		var tween = create_tween()
#		await tween.tween_property($Sprite2D, "scale", Vector2(0,0), 3)
#		seek_player = false
		await get_tree().create_timer(1).timeout
		$player_collision_detector/CollisionShape2D.set_deferred("disabled", false)
#		seek_player = trueaaa
	pass

func update_position():
	global_position = navigation_points.pop_front()
	
func play_ping_sound():
	AudioBus.play_sound_fx(AudioBus.PING)
#	var direction = global_position.direction_to(agent.get_next_path_position())
#	var desired_velocity = direction * SPEED
#	var steering = (desired_velocity - velocity) * delta * 4.0 
#	velocity = SPEED * global_position.direction_to(agent.target_position)
#	move_and_slide()

