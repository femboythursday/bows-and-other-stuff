extends Area2D
class_name Workbench

@onready var instruction_label: Label = $InstructionLabel

var is_interactable: bool = false

func _ready() -> void:
	instruction_label.hide()

func _on_body_entered(body: CharacterBody2D) -> void:
	if body is Player:
		is_interactable = true
		instruction_label.show()

func _on_body_exited(body: CharacterBody2D) -> void:
	if body is Player:
		is_interactable = false
		instruction_label.hide()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if is_interactable:
			PlayerManager.player.toggle_crafting_menu()
