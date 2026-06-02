extends Node2D

func _ready() -> void:
	self.hide()
	if !PlayerManager.player_spawned:
		PlayerManager.set_player_pos(global_position)
		PlayerManager.player_spawned = true
