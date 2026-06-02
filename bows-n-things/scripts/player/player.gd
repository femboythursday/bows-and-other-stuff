class_name Player
extends CharacterBody2D

@export var inventory: Inventory

@onready var crafting_ui: CraftingUI = $CraftingUI
@onready var quest_board_ui: PanelContainer = $QuestBoardUI

var player_direction = GameInputEvents.movement_input()

func _ready() -> void:
	Autoload.set_player_reference(self)

func collect(item) -> void:
	if !inventory.inv_full:
		inventory.insert(item)

func toggle_crafting_menu() -> void:
	if crafting_ui.visible:
		crafting_ui.hide()
		get_tree().paused = false
	else:
		crafting_ui.show()
		get_tree().paused = true

func toggle_quest_board() -> void:
	if quest_board_ui.visible:
		quest_board_ui.hide()
		get_tree().paused = false
	else:
		quest_board_ui.show()
		get_tree().paused = true
