extends Node

func load_new_scene(scene_path: String) -> void:
	PauseMenu.pause_game()
	get_tree().change_scene_to_file(scene_path)
