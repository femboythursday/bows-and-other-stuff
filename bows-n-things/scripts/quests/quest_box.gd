extends PanelContainer
class_name QuestBox

@export var quest: Quest

@onready var quest_title: Label = $MarginContainer/VBoxContainer/QuestTitle
@onready var quest_description: Label = $MarginContainer/VBoxContainer/QuestDescription

func _ready() -> void:
	quest_title.text = quest.title
	quest_description.text = quest.description
