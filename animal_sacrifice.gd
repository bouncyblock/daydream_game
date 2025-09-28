extends Area2D

@onready var game_manager: Node = %gameManager


func _on_body_entered(body: Node) -> void:
	if body is RigidBody2D:
		print("DIE ALREADY")
		game_manager.giveAbility()
		body.queue_free()
