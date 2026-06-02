extends Area2D
class_name QuestBoard

@export var quests: Array[Quest]

@onready var instruction_label: Label = $InstructionLabel

var is_interactable: bool = false

func _ready() -> void:
	instruction_label.hide()

func _on_body_entered(body: CharacterBody2D) -> void:
	is_interactable = true
	instruction_label.show()

func _on_body_exited(body: CharacterBody2D) -> void:
	is_interactable = false
	instruction_label.hide()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") && is_interactable:
		if !quests.is_empty():
			#Autoload.player_node.toggle_quest_board()
			var random_quest: Quest = quests.pick_random()
			QuestManager.add_quest(random_quest)
			quests.erase(random_quest)
		elif quests.is_empty():
			print("no more quests")



## devworm
#signal quest_board_closed
#
#@onready var simple_quest_1: MarginContainer = $MarginContainer/Quests/SimpleQuest1
#
#var quest1_active: bool
#var quest1_completed: bool
#var basic_selfbow: int
#
#func quest1_chat() -> void:
	#simple_quest_1.show()
