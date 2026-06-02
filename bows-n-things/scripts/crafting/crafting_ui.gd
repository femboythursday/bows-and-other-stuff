extends PanelContainer
class_name CraftingUI

@export var design_array: Array[ItemDesign]
@export var design_material_array: Array[ItemData]
@export var player_inv: Inventory

@onready var tree: Tree = $MarginContainer/HBoxContainer/PanelContainer/VBoxContainer/Tree
@onready var title_label: Label = $MarginContainer/HBoxContainer/VBoxContainer/TitleLabel
@onready var item_texture: TextureRect = $MarginContainer/HBoxContainer/VBoxContainer/ItemTexture
@onready var craft_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/CraftButton
@onready var exit_button: TextureButton = $MarginContainer/HBoxContainer/ExitButton

@onready var material_texture_1: TextureRect = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/MaterialContainer1/MarginContainer/HBoxContainer/MaterialTexture1
@onready var material_name_1: Label = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/MaterialContainer1/MarginContainer/HBoxContainer/MaterialName1
@onready var material_texture_2: TextureRect = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/MaterialContainer2/MarginContainer/HBoxContainer/MaterialTexture2
@onready var material_name_2: Label = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/MaterialContainer2/MarginContainer/HBoxContainer/MaterialName2
@onready var material_container_2: PanelContainer = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/MaterialContainer2

var selected_design: ItemDesign

func _ready() -> void:
	build_design_tree()
	if selected_design == null:
		build_design_material_window(design_array[0])

func build_design_tree() -> void:
	tree.hide_root = true
	var tree_root: TreeItem = tree.create_item()
	
	for design in design_array:
		var new_design_slot: TreeItem = tree.create_item(tree_root)
		new_design_slot.set_icon(0, design.design_product.icon)
		new_design_slot.set_text(0, design.design_product.name)

func _on_tree_cell_selected() -> void:
	var cell_design_name: String = tree.get_selected().get_text(0)
	
	for design in design_array:
		if design.design_product.name == cell_design_name:
			build_design_material_window(design)
			selected_design = design
			return

func build_design_material_window(selected_design: ItemDesign) -> void:
	title_label.text = selected_design.design_product.name
	item_texture.texture = selected_design.design_product.icon
	#print("Selected design: ", selected_design.design_name, ". Materials: ", selected_design.design_material_array)

	if selected_design.design_material_array.size() == 2:
		material_container_2.show()
		material_texture_1.texture = selected_design.design_material_array[0].icon
		material_name_1.text = selected_design.design_material_array[0].name
		material_texture_2.texture = selected_design.design_material_array[1].icon
		material_name_2.text = selected_design.design_material_array[1].name
	elif selected_design.design_material_array.size() == 1:
		material_container_2.hide()
		material_texture_1.texture = selected_design.design_material_array[0].icon
		material_name_1.text = selected_design.design_material_array[0].name
	
	#print("Player needs: ",selected_design.design_material_array)
	#print("Player has: ",player_inv.slots)
	if player_inv.slots.has(selected_design.design_material_array):
		print("gay")
	else:
		print("not gay")
	#check_design_craftable()

func check_design_craftable() -> void:
	#print(selected_design.design_material_array)
	if player_inv.slots.has(selected_design.design_material_array[0]):
		print("gay")
	else:
		print("not gay")

func _on_exit_button_button_down() -> void:
	hide()
