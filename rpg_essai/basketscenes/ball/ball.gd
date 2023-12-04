extends RigidBody2D

var picked = false
var is_moving = false


func _physics_process(delta):
	if picked == true:
		self.position = get_node("../player/Position2D").global_position

func _input(event):

	if Input.is_action_just_pressed("test"):
		#apply_impulse(Vector2(400,-720),Vector2(0,0))
		if is_moving:
			linear_velocity = Vector2(0, 0)
			is_moving = false
		# Récupérer la position de la souris
		var mouse_position = get_global_mouse_position()
		# Calculer la direction vers la souris
		var direction = (mouse_position - global_position).normalized()   
		# Appliquer une impulsion à l'objet
		var impulse = direction * 800
		apply_impulse(impulse,Vector2())
		is_moving = true
		print("ici")	




