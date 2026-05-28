extends Resource
class_name ItemData

@export var name: String
@export var icon: Texture2D
#@export var sellable: bool
#@export var description: String
@export var gay: String = "gay"
@export_enum("Bow", "Material") var item_type
@export var amount: int
@export var max_amount: int = 1
