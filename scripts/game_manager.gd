extends Node


var hasDoubleJump = false
var hasWallJump = false
var hasDash = false
var timesDied = 0

func giveAbility():
	print("the ability will be given yippee!")
	hasDoubleJump = true

func giveAbilityDash():
	print("the ability will be given yippee! (this is for dash)")
	hasDash = true

func giveWallJump():
	print("the ability will be given yippee! (this is for wall)")
	hasWallJump = true

func stop_all_audio():     # Recursively stop all audio playing in the scene tree
	_stop_audio_in_node(get_tree().root)

func _stop_audio_in_node(node):
	for child in node.get_children():
		if child is AudioStreamPlayer or child is AudioStreamPlayer2D:
			child.stop()
		elif child.get_child_count() > 0:
			_stop_audio_in_node(child)
