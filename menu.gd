extends Control

func _on_start_pressed():
	get_tree().change_scene("res://world.tscn")

func _on_settings_pressed():
	get_tree().change_scene("res://menu_buttons/settings.tscn")

func _on_quit_pressed():
	get_tree().quit()