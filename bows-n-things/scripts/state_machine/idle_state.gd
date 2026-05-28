extends NodeState

@onready var player: Player = $"../.."
@onready var anim_player: AnimationPlayer = $"../../Sprite2D/AnimationPlayer"

func _on_process(_delta: float) -> void:
	pass

func _on_physics_process(_delta: float) -> void:
	if player.player_direction == Vector2.DOWN:
		anim_player.play("idle_down")
	elif player.player_direction == Vector2.UP:
		anim_player.play("idle_up")
	elif player.player_direction == Vector2.LEFT:
		anim_player.play("idle_left")
	elif player.player_direction == Vector2.RIGHT:
		anim_player.play("idle_right")

func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_moving():
		transition.emit("Walk")

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	anim_player.stop()
