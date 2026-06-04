extends GridContainer
class_name InvUI

const INVENTORY_SLOT = preload("res://scenes/inventory/inventory_slot.tscn")

@export var data: InvData

## clears, then update inventory
func _ready() -> void:
	PlayerManager.inventory_updated.connect(update_inventory)
	clear_inventory()
	update_inventory()
	data.changed.connect(on_inventory_changed)

func clear_inventory() -> void:
	for child in get_children():
		child.queue_free()

## for each slot in player's inventory:
## 	instantiate the slot
## 	add it to the inventory panel
## 	set its data
func update_inventory() -> void:
	clear_inventory()
	
	for slot in data.slots:
		var new_slot = INVENTORY_SLOT.instantiate()
		add_child(new_slot)
		new_slot.slot_data = slot

func on_inventory_changed() -> void:
	clear_inventory()
	update_inventory()






#@onready var inv: Inventory = preload("res://resources/inventories/player_inventory.tres")
#@onready var slots: Array = $MarginContainer/GridContainer.get_children()

#func _ready() -> void:
	#inv.update.connect(update_slots)
	#update_slots()
#
#func update_slots() -> void:
	#for i in range(min(inv.slots.size(), slots.size())):
		#slots[i].update_inv(inv.slots[i])


#extends GridContainer
#class_name InventoryUI

#@onready var slots = get_children()
#signal index(i: int)
#
#var current_index: int:
	#set(value):
		#current_index = value
		#reset_focus()
		#set_focus()
#
#func _ready() -> void:
	#current_index = 0
#
#func reset_focus() -> void:
	#for slot in slots:
		#slot.set_process_input(false)
#
#func set_focus() -> void:
	#get_child(current_index).grab_focus()
	#get_child(current_index).set_process_input(true)
	#index.emit(current_index)
#
#func _input(event) -> void:
	#if event.is_action_pressed("scroll_down"):
		#if current_index == get_child_count() - 1:
			#current_index = 0
		#else:
			#current_index += 1
 #
	#if event.is_action_pressed("scroll_up"):
		#if current_index == 0:
			#current_index = get_child_count() - 1
		#else:
			#current_index -= 1
#
#func add_item(stats) -> void:
	#for slot in slots:
		#if slot.stats == null:
			#slot.stats = stats
			#return

#@onready var inv: Inventory = preload("res://resources/inventories/player_inventory.tres")
#@onready var slots: Array = $MarginContainer/GridContainer.get_children()

#func _ready() -> void:
	#inv.update.connect(update_slots)
	#update_slots()
#
#func update_slots() -> void:
	#for i in range(min(inv.slots.size(), slots.size())):
		#slots[i].update_inv(inv.slots[i])
