## InvData resource populated by SlotData
extends Resource
class_name InvData

@export var slots: Array[SlotData]

func _init() -> void:
	connect_slots()

## returns True if there's space to pick up an item
func add_item(item: ItemData) -> bool:
	## for each slot in inventory:
		## if the slot is empty -> add item -> reutrn true
		## else -> return false
	for i in slots.size():
		if slots[i] == null:
			var new = SlotData.new()
			new.item_data = item
			new.quantity = 1
			slots[i] = new
			new.changed.connect(slot_changed)
			PlayerManager.inventory_updated.emit()
			print(item.name + " added!")
			print(item.name + " count: " + str(new.quantity))
			return true
	
	print("inventory full!")
	return false

func connect_slots() -> void:
	for s in slots:
		if s:
			s.changed.connect(slot_changed)

func slot_changed() -> void:
	for s in slots:
		if s:
			if s.quantity < 1:
				s.changed.disconnect(slot_changed)
				var index = slots.find(s)
				slots[index] = null
				emit_changed()

func use_item(item: ItemData) -> bool:
	for s in slots:
		if s:
			s.quantity -= 1
			print(s.item_data.name + " used!")
			return true
	print("item not found :(")
	return false

## gather inventory into an array
func get_save_data() -> Array:
	var item_save: Array = []
	for i in slots.size():
		item_save.append(item_to_save(slots[i]))
	return item_save

## gather each inventory item into a dictionary
func item_to_save(slot: SlotData) -> Dictionary:
	var result = {
		path = "",
		quantity = 0
	}
	if slot != null: 
		result.quantity = slot.quantity
		if slot.item_data != null:
			result.item = slot.item_data.resource_path
	
	return result
