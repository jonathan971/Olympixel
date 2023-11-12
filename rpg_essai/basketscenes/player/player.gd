extends CharacterBody2D

signal ball(pos, direction)

var can_shoot = true
var canPick = true

#@onready var sprite =$Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#input
	var direction = Input.get_vector("left", "right","up","down")
	velocity = direction * 1000
	#sprite.flip_h = direction < 0
	move_and_slide()
	
	#rotate
	#look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("primary action") and can_shoot :
		can_shoot = false
		var pos = $BallMarker.get_children()[0].global_position
		print(pos)
		var player_direction = (get_global_mouse_position() - position).normalized()
		ball.emit(pos, direction)
		#ball.emit(pos, player_direction)
		
	
