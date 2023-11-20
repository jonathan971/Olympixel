extends CharacterBody2D

const ACCELERATION = 500
const MAX_SPEED = 96
const FRICTION = 600
const GRAVITY = 32

enum{
	MOVE,
	PARADE,
	ATTAQUE
}

var state = MOVE

@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")
@onready var actionable_finder: Area2D = $Direction/ActionableFinder 

func _ready():
	animationTree.active = true

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		
		PARADE:
			parade_state(delta)
		
		ATTAQUE:
			attaque_state(delta)


func move_state(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size()>0:
			actionables[0].action()
			return
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/idle/blend_position", input_vector)
		animationTree.set("parameters/move/blend_position", input_vector)
		animationTree.set("parameters/attaque/blend_position", input_vector)
		animationTree.set("parameters/parade/blend_position", input_vector)
		animationState.travel("move")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION  * delta)
	
	move()
	
	if Input.is_action_just_pressed("parade"):
		state = PARADE
	
	elif Input.is_action_just_pressed("attaque"):
		state = ATTAQUE

func parade_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("parade")

func attaque_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("attaque")

func move():
	move_and_slide()

func parade_animation_finished():
	velocity = Vector2.ZERO
	state = MOVE

func attaque_animation_finished():
	state = MOVE
