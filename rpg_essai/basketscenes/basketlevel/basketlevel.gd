extends Node2D

var ball_scene: PackedScene = preload("res://basketscenes/ball/ball.tscn")

func _on_player_ball(pos, direction):
	var ball = ball_scene.instantiate() as RigidBody2D
	ball.position = pos
	ball.linear_velocity = Vector2.RIGHT * 700
	print("here")

	
 
