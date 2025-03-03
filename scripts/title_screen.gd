class_name MainMenu
extends Control


func _on_play_button_pressed() -> void:
	LevelManager.load_level(1)
	deactivate()


func _on_settings_button_pressed() -> void:
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	get_tree().quit()

func deactivate() -> void:
	hide()
	set_process(false)
	set_physics_process(false)
	set_process_unhandled_input(false)#
	set_process_input(false)
	
func activate() -> void:
	hide()
	set_process(true)
	set_physics_process(true)
	set_process_unhandled_input(true)#
	set_process_input(true)
