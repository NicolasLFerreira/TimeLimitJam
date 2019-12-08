extends Node2D

func _on_restart_pressed():
	get_tree().reload_current_scene()

func _on_back_pressed():
	get_tree().change_scene("res://menu.tscn")

func _on_quit_pressed():
	get_tree().quit()