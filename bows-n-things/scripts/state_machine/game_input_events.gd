class_name GameInputEvents

static var direction: Vector2

## checks direction facing/moving
static func movement_input() -> Vector2:
	if Input.is_action_pressed("move_down"):
		direction = Vector2.DOWN
	elif Input.is_action_pressed("move_up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("move_left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("move_right"):
		direction = Vector2.RIGHT
	else:
		direction = Vector2.ZERO
	
	return direction

## returns if Player is moving or not
static func is_moving() -> bool:
	if direction == Vector2.ZERO: 
		return false 
	else: 
		return true
