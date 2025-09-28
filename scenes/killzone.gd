extends Area2D
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var game_manager: Node = %gameManager
@onready var player: CharacterBody2D = $"../player"

func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D and body.name == "player":
		print("Resetting player...")
		body.global_position = player.starting_location
		# body.velocity = Vector2.ZERO  # Reset movement
		# game_manager.stop_all_audio()
		audio.play()
		Engine.time_scale = 1
