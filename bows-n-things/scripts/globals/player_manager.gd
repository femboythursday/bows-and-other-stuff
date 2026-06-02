extends Node

const PLAYER = preload("res://scenes/player/player.tscn")

var player: Player
var player_spawned := false

func _ready() -> void:
	add_player_instance()
	await get_tree().create_timer(0.5).timeout
	player_spawned = true

func add_player_instance() -> void:
	player = PLAYER.instantiate()
	add_child(player)

func set_player_pos(new_pos: Vector2) -> void:
	player.global_position = new_pos
