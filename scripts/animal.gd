extends RigidBody2D

# Inside the RigidBody2D script
var original_position: Vector2

func _ready() -> void:
	original_position = global_position
