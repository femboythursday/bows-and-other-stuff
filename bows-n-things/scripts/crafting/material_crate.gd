extends Area2D

@export var item: ItemData

@onready var stock_display: Control = $StockDisplay
@onready var stock_label: Label = $StockDisplay/PanelContainer/HBoxContainer/StockLabel
@onready var item_texture: TextureRect = $StockDisplay/PanelContainer/HBoxContainer/ItemTexture

var player_in_area: bool = false
var stock_quantity: int = 0
var max_stock_quantity: int = 10

func _ready() -> void:
	stock_display.hide()

func _on_body_entered(_body: Node2D) -> void:
	player_in_area = true
	stock_display.show()
	stock_label.text = str(stock_quantity) + "/10"
	item_texture.texture = item.icon

func _on_body_exited(_body: Node2D) -> void:
	player_in_area = false
	stock_display.hide()

func _unhandled_input(event: InputEvent) -> void:
	if player_in_area:
		if Input.is_action_just_pressed("interact"):
			if stock_quantity < 10:
				if PlayerManager.INVENTORY.use_item(item):
					stock_quantity += 1
					stock_label.text = str(stock_quantity) + "/10"



#func _process(delta: float) -> void:
	#if player_in_area:
		#if Input.is_action_just_pressed("interact"):
			##if stock_quantity < max_stock_quantity:
			##if Autoload.player_node.inventory.slots.has(item):
			##if item in Autoload.player_node.inventory.slots:
			### add item to crate and remove item from inv
			#Autoload.player_node.inventory.slots.erase(item)
			#stock_quantity += 1
			#stock_label.text = str(stock_quantity) + "/10"
			#print("CRATE: added ", item)
