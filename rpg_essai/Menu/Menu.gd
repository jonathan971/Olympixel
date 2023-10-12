extends Control


func _on_button_jouer_pressed():
	get_tree().change_scene_to_file("res://world.tscn")


func _on_button_quitter_pressed():
	get_tree().quit()


func _on_button_crédits_pressed():
	get_tree().change_scene_to_file("res://Menu/credits.tscn")


func _on_button_options_pressed():
	get_tree().change_scene_to_file("res://Menu/options.tscn")

