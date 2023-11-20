
extends CharacterBody2D

var run_speed=100
var jump_speed=-180
var gravity=1000
var jumping=false
@onready var animationPlayer = $AnimationPlayer
@onready var jumpSoundPlayer = $JumpSoundPlayer

func get_input():
	velocity.x=0
	var right=Input.is_action_pressed("ui_right")
	var jump=Input.is_action_pressed("ui_up")
	if jump and is_on_floor():
		jumpSoundPlayer.play()
		jumping=true
		animationPlayer.play("jump_right")
		velocity.y=jump_speed
		
	elif right:
		animationPlayer.play("run_right")
		velocity.x += run_speed
	else :
		animationPlayer.play("idle_right") 
		

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping=false
	move_and_slide()



