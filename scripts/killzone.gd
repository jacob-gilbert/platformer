class_name Killzone
extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.get_node("CollisionShape2D").queue_free()
		body.modulate = Color("Red")
		timer.start()
	


func _on_timer_timeout() -> void:
	LevelManager.load_level(LevelManager.loaded_level.level_id)
