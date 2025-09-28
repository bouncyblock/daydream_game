extends CharacterBody2D

@onready var game_manager: Node = %gameManager

var push_force = 40.0
var jumps_used = 0
var acceleration = 750.0
var deceleration = 740.0
var max_speed = 200.0
const JUMP_VELOCITY = -250.0
var starting_location = Vector2()
var usedDash = false

func _ready():
	starting_location = global_position

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Reset jump count when grounded
	if is_on_floor():
		jumps_used = 0
		usedDash = false

	# Handle jumping
	if Input.is_action_just_pressed("jump"):
		if (!game_manager.hasDoubleJump and jumps_used < 1) or (game_manager.hasDoubleJump and jumps_used < 2):
			velocity.y = JUMP_VELOCITY
			jumps_used += 1
	
	
	# Handle horizontal movement with momentum
	var direction := Input.get_axis("left", "right")
	
	
# Apply movement with momentum
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * max_speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, deceleration * delta)

	if Input.is_action_just_pressed("dash") and !usedDash:
		velocity.x = move_toward(velocity.x * 3.5, direction * max_speed * 2, acceleration * delta * 2)
		usedDash = true
	# Move the character
	move_and_slide()

	# Apply impulse to rigid bodies on collision
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is RigidBody2D:
			collision.get_collider().apply_central_impulse(-collision.get_normal() * push_force)
