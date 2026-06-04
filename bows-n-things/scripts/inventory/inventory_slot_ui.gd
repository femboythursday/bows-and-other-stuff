extends Button
class_name InvSlotUI

@onready var item_display: TextureRect = $ItemDisplay
@onready var name_label: Label = $NameLabel

var slot_data: SlotData: set = set_slot_data

## clears the item data
func _ready() -> void:
	#Autoload.inventory_updated.connect(update_inventory)
	name_label.hide()
	name_label.text = ""
	item_display.texture = null

## if slot has no item, display nothing
## otherwise, set the slot's item's data to the item it holds
func set_slot_data(value: SlotData) -> void:
	slot_data = value
	#if slot_data.item_data == null:
	## IMPORTANT: if slot has a SlotData, it NEEDS an ItemData!!!!!!!
	if slot_data == null:
		item_display.texture = null
		name_label.text = ""
		return
	item_display.texture = slot_data.item_data.icon
	name_label.text = slot_data.item_data.name
	print("set slot data!")

func _on_hover_mouse_entered() -> void:
	name_label.show()

func _on_hover_mouse_exited() -> void:
	name_label.hide()

#func update_inventory() -> void:
	#if slot_data == null:
		#item_display.texture = null
		#name_label.text = ""
		#return
	#item_display.texture = slot_data.item_data.icon
	#name_label.text = slot_data.item_data.name
	#print("inventory updated!")




#func update_inv(slot: InventorySlot) -> void:
	#if !slot.item:
		#item_display.hide()
	#else:
		#item_display.show()
		#item_display.texture = slot.item.icon
		#name_label.text = slot.item.name
