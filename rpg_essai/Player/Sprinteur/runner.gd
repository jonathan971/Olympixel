extends CharacterBody2D

const speed = 350 # Vitesse de déplacement
const jump_force = -400
const friction = 5.0 # Ajoutez une constante de friction
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # Assurez-vous que le chemin est correct
var is_jumping = false
var arrival_position = Vector2(2211.341, 463.1747)
var arrival_threshold = 10.0 

@onready var animation = $AnimationPlayer
@onready var rich_text_label = $ColorRect2/RichTextLabel
	
func _some_function_to_start_timer():
	rich_text_label.start_timer()
	
func _physics_process(delta):
	var on_floor = is_on_floor()
	
	# Appliquer la gravité si le personnage n'est pas sur le sol
	if not on_floor:
		velocity.y += gravity * delta

	# Gérer le saut
	if Input.is_action_just_pressed("ui_up") and on_floor:
		velocity.y = jump_force
		is_jumping = true
		animation.play("jump")

	# Déplacer le personnage vers la droite si la touche d'avance est enfoncée
	elif Input.is_action_pressed("move_right"):
		velocity.x = speed
		if on_floor and not is_jumping: # Jouer l'animation de course seulement si sur le sol et pas en train de sauter
			animation.play("run")
	elif on_floor:
		# Appliquer la friction pour ralentir le personnage à l'arrêt
		velocity.x = lerp(velocity.x, 0.0, friction * delta)
		if not is_jumping: # Jouer l'animation "idle" seulement si sur le sol et pas en train de sauter
			animation.play("idle")

	# Si le personnage est sur le sol, réinitialiser l'état de saut
	if on_floor and is_jumping:
		is_jumping = false
		
	if global_position.distance_to(arrival_position) <= arrival_threshold:
		rich_text_label.stop_timer()
	# Déplacer le personnage
	move_and_slide()
