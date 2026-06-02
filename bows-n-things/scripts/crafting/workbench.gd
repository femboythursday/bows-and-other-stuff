extends Area2D
class_name Workbench

var is_interactable: bool = false

func _on_body_entered(body: CharacterBody2D) -> void:
	if body is Player:
		is_interactable = true

func _on_body_exited(body: CharacterBody2D) -> void:
	if body is Player:
		is_interactable = false

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if is_interactable:
			Autoload.player_node.toggle_crafting_menu()
