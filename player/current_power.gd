extends Control

func _process(delta):
	
	$label.text = ("              Power: " + str(p.pCurrent))