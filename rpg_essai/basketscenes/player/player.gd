extends CharacterBody2D

signal ball(pos, direction)


func _on_animated_sprite_2d_animation_looped():
	$AnimatedSprite2D.stop()
