extends Area2D


@onready var game_manager: Node = %gameManager


func _on_body_entered(body: CharacterBody2D) -> void:
	if body.name == "player":
		game_manager.switch_to_level("TileMapLayer2")  # Example: switch to level 2
