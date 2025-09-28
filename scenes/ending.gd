extends Area2D


@onready var game_manager: Node = %gameManager
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_body_entered(body: CharacterBody2D) -> void:
	Engine.time_scale = 0.1
	game_manager.stop_all_audio()
	audio_stream_player_2d.play()
