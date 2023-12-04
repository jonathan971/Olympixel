extends CharacterBody2D

const SPEED = 30.0

@onready var perso = $AnimationPlayer
@onready var actionable_finder: Area2D = $Action
func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size()>0:
			actionables[0].action()
			return

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
