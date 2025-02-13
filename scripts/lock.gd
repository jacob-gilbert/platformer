class_name Lock
extends Area2D

@onready var timer: Timer = $Timer
@onready var lock: Lock = $"."

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "player"):
		if body.has_key == true:
			lock.modulate = Color("Green")
			timer.start()


func _on_timer_timeout() -> void:
	if LevelManager.loaded_level.level_id + 1 == 4:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	LevelManager.load_level(LevelManager.loaded_level.level_id + 1)
