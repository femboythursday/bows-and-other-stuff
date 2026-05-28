extends Resource
class_name Inventory

signal update

@export var slots: Array[InventorySlot]

var inv_full: bool

func _ready() -> void:
	Autoload.set_player_inventory(slots)

func insert(item: ItemData) -> void:
	var empty_slots = slots.filter(func(slot): return slot.item == null)
	if empty_slots.is_empty():
		print("inv full :(")
		inv_full = true
		return
	elif !empty_slots.is_empty():
		inv_full = false
		empty_slots[0].item = item
		empty_slots[0].amount = 1
		print("INVENTORY: ", item)
	update.emit()

func remove(item: ItemData) -> void:
	pass
