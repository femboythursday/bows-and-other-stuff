extends NodeState

@onready var player: Player = $"../.."
@onready var anim_player: AnimationPlayer = $"../../Sprite2D/AnimationPlayer"

var speed: float = 50

func _on_process(_delta: float) -> void:
	pass

func _on_physics_process(_delta: float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	
	if direction == Vector2.DOWN:
		anim_player.play("walk_down")
	elif direction == Vector2.UP:
		anim_player.play("walk_up")
	elif direction == Vector2.LEFT:
		anim_player.play("walk_left")
	elif direction == Vector2.RIGHT:
		anim_player.play("walk_right")
	
	if direction != Vector2.ZERO:
		player.player_direction = direction
	
	player.velocity = direction * speed
	player.move_and_slide()

func _on_next_transitions() -> void:
	if !GameInputEvents.movement_input():
		transition.emit("Idle")

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	anim_player.stop()
