extends Control



func _on_button_retour_pressed():
	get_tree().change_scene_to_file("res://Menu/menu.tscn")



func _on_button_commentjouer_pressed():
	get_tree().change_scene_to_file("res://Menu/comment_jouer.tscn")


func _on_button_histoire_pressed():
	get_tree().change_scene_to_file("res://Menu/histoire.tscn")
