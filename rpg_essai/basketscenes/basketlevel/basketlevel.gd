extends Node2D

var x
var y
var count = 0
var can_shoot = true

@onready var pause_menu = $CanvasLayer/PauseMenu
var paused = false

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else :
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused
	
func stopMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1

func _ready():
	var initial_x = $ball.position.x
	var initial_y = $ball.position.y
	print("initial_x : ", initial_x)
	print("initial_y : ", initial_y)
	
	
	get_node("ball").picked = true
	get_node("ball").linear_velocity = Vector2(0, 0)
	

func _process(delta):

	x = $ball.position.x
	y = $ball.position.y

	if (y>560):
		count += 1
		print(count)
	if (count == 100):
		print ("reset la ball")
		get_node("ball").linear_velocity = Vector2(0, 0)
		get_node("ball").picked = true
		count = 0
		can_shoot = true
	
	if  Input.is_action_just_pressed("pause"):
		pauseMenu()



func get_impulse_vector(angle,size):
	angle = angle * PI / 180
	var fx = size * cos(angle)
	var fy = size * sin(angle)
	var out = Vector2(fx,-fy)
	return out


func _on_button_shoot_pressed():
	
	if (can_shoot == true):
		get_node("ball").picked = false
		get_node("ball").linear_velocity = Vector2(0, 0)
		print("button pressed")
		
		var angle = $CanvasLayer/HSliderAngle.value
		var force = $CanvasLayer/HSliderForce.value
		
		print("Angle :", angle)
		print("Force :", force)
		
		
		var offset
		var impulse
		offset = Vector2(0,0)
		impulse = get_impulse_vector(angle,force)
		
		$ball.apply_impulse(impulse,offset)
		var anim = get_node("player/AnimatedSprite2D")
		anim.play("tirer")
		can_shoot = false






