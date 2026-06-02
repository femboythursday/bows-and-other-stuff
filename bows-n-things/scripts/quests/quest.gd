extends Resource
class_name Quest

@export_category("Progress")
@export var quantity_collected: int
@export var quantity_goal: int
@export var quest_type: QuestManager.QUEST_TYPE
@export var quest_item: QuestManager.ITEM

@export_category("Completion")
@export var reward_gold: int

@export_category("Ingo")
@export var id: int
@export var title: String
@export_multiline var description: String
#@export var time_limit_days: int

func get_brief_description() -> String:
	var quest_state = str(quantity_collected) + "/" + str(quantity_goal)
	return "Sell Basic Selfbow: " + quest_state

func get_quest_item() -> QuestManager.ITEM:
	return quest_item
