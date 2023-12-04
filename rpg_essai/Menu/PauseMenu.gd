extends Control

@onready var main  = $"../../"


func _on_button_jouer_pressed():
	main.pauseMenu()





func _on_button_quitter_pressed():
	main.stopMenu()
	get_tree().change_scene_to_file("res://Menu/menu.tscn")

