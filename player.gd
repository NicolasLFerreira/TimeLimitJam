extends KinematicBody2D

#movement

var speed = 150
var max_speed = 750
var jump = -900

#physics

var friction = false
var g = 30
var vector = Vector2()

#power

#// p stands for "power"

const opGen = 10
var pGen = 10
var pPot = 3

func _physics_process(delta):
	
	#function call
	
	dash()
	
	getInput()
	
	vector = move_and_slide(vector, Vector2(0, -1))
	
	#gravity
	
	if not is_on_floor():
		vector.y += g
	else:
		vector.y = 0

func getInput():
	
	#left and right
	
	if (Input.is_action_pressed("left")):
		vector.x = max(vector.x-speed, -max_speed)
	
	elif (Input.is_action_pressed("right")):
		vector.x = min(vector.x+speed, max_speed)
	
	#idle
	
	else:
		friction = true
	
	#both input
	
	if (Input.is_action_pressed("right") and Input.is_action_pressed("left")):
		vector.x = 0
	
	#friction
	
	
	if !is_on_floor():
		if friction:
			vector.x = lerp(vector.x, 0, 0.005)

	
	if is_on_floor():
		
		#jump
		
		if (Input.is_action_pressed("jump")):
			vector.y = jump
		
		#friction
		
		if friction:
			vector.x = lerp(vector.x, 0, 0.2)

func dash():
	
	var m_pos = get_local_mouse_position()
	
	if p.pCurrent == p.pCap:
		
		#boost
		
		if Input.is_action_just_pressed("power"):
			vector = m_pos * pPot
			
		
		#pGen fix
		
		pGen -= opGen
	else:
		pGen = opGen

func _on_power_gen_timeout():
	if p.pCurrent < p.pCap:
		p.pCurrent = p.pCurrent + pGen