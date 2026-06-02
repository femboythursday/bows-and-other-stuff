extends CanvasLayer

@onready var save_button: Button = $PanelContainer/VBoxContainer/SaveButton
@onready var load_button: Button = $PanelContainer/VBoxContainer/LoadButton
@onready var quit_button: Button = $PanelContainer/VBoxContainer/QuitButton

var is_paused: bool = false

func _ready() -> void:
	self.hide()
	is_paused = false

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("pause"):
		if !is_paused:
			pause_game()
		else:
			unpause_game()
		get_viewport().set_input_as_handled()

func pause_game() -> void:
	get_tree().paused = true
	self.show()
	is_paused = true

func unpause_game() -> void:
	get_tree().paused = false
	self.hide()
	is_paused = false

func _on_save_button_pressed() -> void:
	if !is_paused:
		return
	SaveManager.save_game()
	unpause_game()

func _on_load_button_pressed() -> void:
	if !is_paused:
		return
	SaveManager.load_game()
	unpause_game()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
