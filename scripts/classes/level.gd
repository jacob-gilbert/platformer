class_name Level
extends Node

@export var level_id : int
var level_data : LevelData

func _ready() -> void:
	level_data = LevelManager.get_level_data_by_id(level_id)

func get_level_id() -> int:
	return level_id

func _on_start_level_01_pressed() -> void:
	pass
