extends PanelContainer

@onready var inv: Inventory = preload("res://resources/inventories/player_inventory.tres")
@onready var slots: Array = $MarginContainer/GridContainer.get_children()

#func _ready() -> void:
	#inv.update.connect(update_slots)
	#update_slots()
#
#func update_slots() -> void:
	#for i in range(min(inv.slots.size(), slots.size())):
		#slots[i].update_inv(inv.slots[i])
