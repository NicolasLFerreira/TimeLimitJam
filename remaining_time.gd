extends Control

func _process(delta):
	$label.text = ("Remaining time: " + str(timer.time))