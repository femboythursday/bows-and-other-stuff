extends Node

const SAVE_PATH = "user://"

signal game_loaded
signal game_saved

var current_save: Dictionary = {
	player = {
		pos_x = 0,
		pos_y = 0
	},
	items = [],
	persistence = [], ## any variables that should save
	quests = [
		# {title = "not found", is_complete = false, requirements_present = []}
	]
}

func save_game() -> void:
	update_data()
	var file := FileAccess.open(SAVE_PATH + "save.sav", FileAccess.WRITE)
	var save_json := JSON.stringify(current_save)
	file.store_line(save_json)
	game_saved.emit()

func load_game() -> void:
	var file := FileAccess.open(SAVE_PATH + "save.sav", FileAccess.READ)
	var json: = JSON.new()
	json.parse(file.get_line())
	var save_dic: Dictionary = json.get_data() as Dictionary
	current_save = save_dic
	
	PlayerManager.set_player_pos(Vector2(current_save.player.pos_x, current_save.player.pos_y))
	
	print("game loaded")

func update_data() -> void:
	var p: Player = Autoload.player_node
	current_save.player.pos_x = p.global_position.x
	current_save.player.pos_y = p.global_position.y
