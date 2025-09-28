extends Area2D


@onready var game_manager: Node = %gameManager
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _on_body_entered(body: CharacterBody2D) -> void:
	Engine.time_scale = 0.1
	game_manager.stop_all_audio()
	audio_stream_player.play()
