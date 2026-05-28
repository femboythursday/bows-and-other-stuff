extends Button

@onready var item_display: TextureRect = $ItemDisplay
@onready var name_label: Label = $NameLabel

func _ready() -> void:
	name_label.hide()
	name_label.text = ""
	item_display.texture = null

func update_inv(slot: InventorySlot) -> void:
	if !slot.item:
		item_display.hide()
	else:
		item_display.show()
		item_display.texture = slot.item.icon
		name_label.text = slot.item.name

func _on_mouse_entered() -> void:
	name_label.show()

func _on_mouse_exited() -> void:
	name_label.hide()
