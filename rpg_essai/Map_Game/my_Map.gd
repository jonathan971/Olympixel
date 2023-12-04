extends Node2D

@onready var pause_menu = $Perso_principal/PauseMenu

var paused = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if  Input.is_action_just_pressed("pause"):
		pauseMenu()
	


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

