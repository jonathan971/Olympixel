extends Area2D

var speed = 30
var player_chase = false
var player_attack = false
var player = null
var random_direction = Vector2.ZERO

func random_movment(delta):
	if random_direction == Vector2.ZERO or randf() < 0.005:  # Changer 0.02 selon la fréquence souhaitée
		random_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	position += random_direction * speed * delta
		#position+=(player.position)/speed

func _on_body_entered(body):
	player = body
	player_attack = true

func _on_body_exited(body):
	player = null
	player_attack = false
