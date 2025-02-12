#class_name Key
extends Area2D

var got_key : bool = false

@onready var key_label: Label = $"../Panel/KeyLabel"

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "player"):
		queue_free()
	got_key = true
	print("Got Key")
	key_label.set("theme_override_colors/font_color", Color(0, 1, 0, 1))
