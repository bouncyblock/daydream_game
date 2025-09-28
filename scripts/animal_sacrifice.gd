extends Area2D

@onready var game_manager: Node = %gameManager
@onready var respawn_timer: Timer = Timer.new()
var body_scene: PackedScene = preload("res://scenes/animal.tscn")
var original_position: Vector2

func _ready() -> void:
	add_child(respawn_timer)
	respawn_timer.wait_time = 3.0
	respawn_timer.one_shot = true
	respawn_timer.connect("timeout", Callable(self, "_on_respawn_timeout"))

func _on_body_entered(body: Node) -> void:
	if body is RigidBody2D:
		print("DIE ALREADY")
		game_manager.giveAbility()
		if game_manager.timesDied >= 1:
			game_manager.giveAbilityDash()
			print("in loop")
		game_manager.timesDied += 1
		print("timesDied" + str(game_manager.timesDied))
		# Get the original spawn position from the body
		original_position = body.original_position
		
		body.queue_free()
		#respawn_timer.start()

func _on_respawn_timeout() -> void:
	var new_body = body_scene.instantiate()
	new_body.global_position = original_position
	get_tree().current_scene.add_child(new_body)
