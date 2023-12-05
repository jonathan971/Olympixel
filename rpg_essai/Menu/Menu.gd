extends Control

@onready var music = $Music

func _ready():
	music.play()

func _on_button_jouer_pressed():
	get_tree().change_scene_to_file("res://Map_Game/my_Map.tscn")


func _on_button_quitter_pressed():
	get_tree().quit()


func _on_button_crédits_pressed():
	get_tree().change_scene_to_file("res://Menu/credits.tscn")


func _on_button_options_pressed():
	get_tree().change_scene_to_file("res://Menu/options.tscn")

