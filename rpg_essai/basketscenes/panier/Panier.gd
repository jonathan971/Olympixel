extends Area2D

var score = 0
@onready var scoreLabel = $"../UserInterface/GameUI/Score"


func _on_area_entered(area):
	if area.is_in_group("ball"):
		print("panier enterrred")
		area.get_parent().queue_free()
		score += 1
		scoreLabel.text = "Score : %d" % score
