extends Control

const QUEST_BOX = preload("res://scenes/quests/quest_box.tscn")

func _ready() -> void:
	QuestManager.quest_updated.connect(add_hud)
	add_hud()

func add_hud() -> void:
	for child in self.get_children():
		child.queue_free()
	
	for q in QuestManager.active_quests:
		var quest_box = QUEST_BOX.instantiate()
		quest_box.quest = q
		self.add_child(quest_box)
