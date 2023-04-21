extends Area2D

@export var cooldown_time : float = 1

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		body.global_position = global_position
		AudioBus.play_sound_fx(AudioBus.BUBBLE_ENTER)
		body.states.change_state(body.states.super_dash_state)
		await get_tree().create_timer(1).timeout
		$AnimationPlayer.play("pop")
		AudioBus.play_sound_fx(AudioBus.DASH)
		AudioBus.play_sound_fx(AudioBus.BUBBLE_POP)
		await get_tree().create_timer(cooldown_time).timeout
		$AnimationPlayer.play("idle")
		
	pass # Replace with function body.
