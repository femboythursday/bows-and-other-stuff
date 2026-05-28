extends Area2D

@export var item: ItemData

@onready var stock_display: Control = $StockDisplay
@onready var stock_label: Label = $StockDisplay/PanelContainer/HBoxContainer/StockLabel
@onready var item_texture: TextureRect = $StockDisplay/PanelContainer/HBoxContainer/ItemTexture

var player_in_area: bool = false
var stock_quantity: int = 50

func _ready() -> void:
	stock_display.hide()

func _on_body_entered(body: Node2D) -> void:
	player_in_area = true
	stock_display.show()
	stock_label.text = str(stock_quantity) + "/50"
	item_texture.texture = item.icon

func _on_body_exited(body: Node2D) -> void:
	player_in_area = false
	stock_display.hide()

func _process(delta: float) -> void:
	if player_in_area:
		if Input.is_action_just_pressed("interact"):
			if !Autoload.player_node.inventory.inv_full:
				Autoload.player_node.collect(item)
				stock_quantity -= 1
				stock_label.text = str(stock_quantity) + "/50"
				print("STOCK: collected ", item)
