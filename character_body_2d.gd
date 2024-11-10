extends CharacterBody2D

# Declaring speed variables
const speed = 300.0

# Storing click and target position. 
var click_position : Vector2
var target_position : Vector2

func _ready() -> void:
	# Adjusting current position when object is spawned
	click_position = position

func _physics_process(delta: float) -> void:
	# Saving click position whenever user clicks somewhere
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		click_position = get_global_mouse_position()
	
	# If player is too far away from click position, then move
	# Distance might be adjusted depending on the tile sizes and etc
	if position.distance_to(click_position) > 3:
		target_position = (click_position - position).normalized()
		velocity = target_position * speed
		move_and_slide()
