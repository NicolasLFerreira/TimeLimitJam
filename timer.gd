extends Timer

#variables

var time = 60
var loss = 1

func _process(delta):
	
	#time ran out
	
	if time <= 0:
		get_tree().change_scene("res://game_over.tscn")
		loss = 0

func _on_Timer_timeout():
	time = time - loss