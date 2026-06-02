extends Node

signal quest_updated

var inventory := preload("res://resources/inventories/player_inventory.tres")
var active_quests: Array[Quest]

enum QUEST_TYPE {
	BOW_REQUEST
}
enum ITEM {
	BASIC_SELFBOW
}

func add_quest(quest: Quest) -> void:
	active_quests.append(quest.duplicate())
	quest_updated.emit()
	print(quest.title + " added!")

## michael games video
#signal quest_updated(quest)
#
#const QUEST_DATA_LOCATION := "res://resources/quests/"
#
#var quests: Array[Quest]
#var current_quests: Array # {title = "not found", requirements_met = false, is_complete = false}
#
#func _ready() -> void:
	#gather_quest_data()
#
#func _unhandled_input(event: InputEvent) -> void:
	#if event.is_action_pressed("test"):
		##print(find_current_quest(load("res://resources/quests/daily_quest.tres") as Quest))
		##print(find_quest_by_id(1))
		##print(get_quest_index_by_title("weekly orDer"))
		##print("femboy!")
		#print("Before: ", current_quests)
		#update_quest(1)
		#print("After: ", current_quests)
		#print("==================================")
#
#func gather_quest_data() -> void:
	#var quest_files := DirAccess.get_files_at(QUEST_DATA_LOCATION)
	#quests.clear()
	#for quest in quest_files:
		#quests.append(load(QUEST_DATA_LOCATION + "/" + quest) as Quest)
#
#func update_quest(_id: int, _requirements_met: Array[ItemData], _is_complete: bool = false) -> void:
	#var quest_index: int = get_quest_index_by_id(_id)
	#if quest_index == -1:
		### if the quest doesn't exist -> add it to current_quests array
		#var new_quest := {
				#id = _id, 
				#is_complete = _requirements_met, 
				#requirements_met = []
			#}
		#
		### if quest's requirements_met array is NOT empty -> update it
		#if _requirements_met != []:
			#new_quest.requirements_met.append(_requirements_met)
		#
		#current_quests.append(new_quest)
		#quest_updated.emit(new_quest)
	#else:
		### quest was found -> update it
		#var q = current_quests[quest_index]
		### if quest's requirements_met array is NOT empty && doesn't contain _requirements_met 
		### -> update it
		#if _requirements_met != [] && !q.requirements_met.has(_requirements_met):
			#q.requirements_met.append(_requirements_met)
		#
		#q.is_complete = _is_complete
		#quest_updated.emit(q)
#
#func give_rewards() -> void:
	#pass
#
#func find_current_quest(_quest: Quest) -> Dictionary:
	#for q in current_quests:
		#if q.title.to_lower() == _quest.title.to_lower():
			#return q
	#
	#return {title = "not found", is_complete = false, requirements_met = []}
#
#func find_quest_by_id(_id: int) -> Quest:
	#for q in quests:
		#if q.id == _id:
			#return q
	### if it doesn't find it:
	#return null
#
#func get_quest_index_by_id(_id: int) -> int:
	#for i in current_quests.size():
		#if current_quests[i].id == _id:
			#return i
	### if it doesn't find it:
	#return -1
#
#func sort_quests() -> void:
	#pass 
