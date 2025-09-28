extends Area2D

func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D and body.name == "player":
		print("Resetting player...")
		body.global_position = Vector2(0, 0)  # Replace with your spawn point
		body.velocity = Vector2.ZERO  # Reset movement
