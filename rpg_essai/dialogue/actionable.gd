extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
@onready var effect = $Effect
func action() -> void:
	effect.play()
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	
