extends KinematicBody2D

#movement

var speed = 25
var max_speed = 450
var jump = -900

#physics

var g = 30
var vector = Vector2()

func _physics_process(delta):
	
	getInput()
	
	vector = move_and_slide(vector, Vector2(0, -1))
	
	#gravity
	
	if not is_on_floor():
		vector.y += g
	else:
		vector.y = 0

func getInput():
	
	#running
	
	if Input.is_action_pressed("left"):
		vector.x = max(vector.x-speed, -max_speed)
	elif Input.is_action_pressed("right"):
		vector.x = min(vector.x+speed, max_speed)
	else:
		vector.x = 0
	
	if Input.is_action_pressed("right") and Input.is_action_pressed("left"):
		vector.x = 0
	
	#jumping
	
	if is_on_floor() and Input.is_action_pressed("jump"):
		vector.y = jump