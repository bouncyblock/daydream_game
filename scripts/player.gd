extends CharacterBody2D

@onready var game_manager: Node = %gameManager

var push_force = 40.0
var jumpsUsed = 0
const SPEED = 200.0
const JUMP_VELOCITY = -250.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# print("doublejump status:" + str(game_manager.hasDoubleJump))
	if is_on_floor():
		jumpsUsed = 0
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and jumpsUsed != 1 and not game_manager.hasDoubleJump:
		velocity.y = JUMP_VELOCITY
		jumpsUsed += 1
	
	if Input.is_action_just_pressed("ui_up") and jumpsUsed != 2 and game_manager.hasDoubleJump:
		velocity.y = JUMP_VELOCITY
		jumpsUsed += 1
	
	
	
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	
	
	move_and_slide()
	
	# after calling move_and_slide()
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
	
	
