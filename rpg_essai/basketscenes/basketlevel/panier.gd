extends Area2D

var score = 0
@onready var scoreLabel = $"../CanvasLayer/GameUI/Score"

func _on_area_entered(area):
	if area.is_in_group("ball"):
		print("panier enterrred")
		score += 1
		scoreLabel.text = "Score : %d" % score
