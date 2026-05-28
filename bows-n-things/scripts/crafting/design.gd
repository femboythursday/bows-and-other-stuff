extends Resource
class_name Design

@export var name: String
@export var icon: Texture2D
@export var materials: Dictionary[Item,int]
@export var product: Item
@export var product_amount: int = 1
@export var craft_time: float = 5.0
