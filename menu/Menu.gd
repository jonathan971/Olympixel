extends Node2D




func _on_Jouer_pressed():
	get_tree().change_scene("res://game.tscn")

func _on_Options_pressed():
	pass # Replace with function body.


func _on_Crdits_pressed():
	pass # Replace with function body.


func _on_Quitter_pressed():
	get_tree().quit()
