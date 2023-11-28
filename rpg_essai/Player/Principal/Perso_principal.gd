extends CharacterBody2D

const SPEED = 30.0

@onready var perso = $AnimationPlayer

func _physics_process(delta):
	velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED
		perso.play("up")
	elif Input.is_action_pressed("ui_down"):
		velocity.y = SPEED
		perso.play("down")
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		perso.play("right")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		perso.play("left")
		

	move_and_slide()
