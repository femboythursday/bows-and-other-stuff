class_name Player
extends CharacterBody2D

@export var inventory: Inventory

@onready var crafting_ui: CraftingUI = $CraftingUI

var player_direction = GameInputEvents.movement_input()

func _ready() -> void:
	Autoload.set_player_reference(self)

func collect(item) -> void:
	if !inventory.inv_full:
		inventory.insert(item)
		print("PLAYER: ", item)

func toggle_crafting_menu() -> void:
	if crafting_ui.visible:
		crafting_ui.hide()
	else:
		crafting_ui.show()
