extends Node

signal inventory_updated

var inventory: Array = []
var player_node: Node = null
var player_inventory: Inventory

func _ready() -> void:
	inventory.resize(9)

func add_item() -> void:
	inventory_updated.emit()

func remove_item() -> void:
	inventory_updated.emit()

func set_player_reference(player):
	player_node = player

func set_player_inventory(inv):
	player_inventory = inv
