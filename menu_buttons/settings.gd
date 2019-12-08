extends Control

var fullscreen = false
var maximized = false

func _process(delta):
	
	#fullscreen
	
	if fullscreen:
		$menu_area/center_row/buttons/fullscreen/label.text = ("Fullscreen: on")
	else:
		$menu_area/center_row/buttons/fullscreen/label.text = ("Fullscreen: off")
	
	#maximized
	
	if maximized:
		$menu_area/center_row/buttons/maximize/label.text = ("Maximized: on")
	else:
		$menu_area/center_row/buttons/maximize/label.text = ("Maximized: off")

func _on_fullscreen_pressed():
	
	fullscreen = !fullscreen
	
	OS.window_fullscreen = !OS.window_fullscreen


func _on_maximize_pressed():
	
	maximized = !maximized
	
	if maximized:
		OS.set_window_size(Vector2(1920, 1080))
	else:
		OS.set_window_size(Vector2(1280, 720))

func _on_back_pressed():
	get_tree().change_scene("res://menu.tscn")