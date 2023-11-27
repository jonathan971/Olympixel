extends CharacterBody2D

const ACCELERATION = 500
const MAX_SPEED = 96
const FRICTION = 600
const GRAVITY = 32

enum {
	MOVE,
	PARADE,
	ATTAQUE
}

var state = MOVE

@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")
@onready var actionable_finder: Area2D = $Direction/ActionableFinder
@onready var actionable_finder2: Area2D = $DetectionEscrimeurZone

var random_action_probability = 0.08

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
	var input_vector = Vector2.ZERO
	var escrimeur_node = get_node("../escrimeur")
	if escrimeur_node is CharacterBody2D:
		var attaque_value = escrimeur_node.attaque
		if randf() < random_action_probability:
			random_action()
		else:
			#actionable_finder2.random_movment(delta)
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
				velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

			move()

func random_action():
	var random_value = randf()
	if random_value < 0.22:
		state = ATTAQUE
	elif random_value < 0.66:
		state = PARADE

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

# Ajoutez ici vos fonctions pour les conditions spécifiques qui déclencheront les changements d'état automatiques
func condition_pour_attaque():
	# Logique pour déterminer si le personnage doit passer à l'état d'attaque
	return false

func condition_pour_parade():
	# Logique pour déterminer si le personnage doit passer à l'état de parade
	return false
