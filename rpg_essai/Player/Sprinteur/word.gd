extends Node2D

@onready var label = $ColorRect3/RichTextLabel2  # Assurez-vous que le chemin est correct
@onready var runner = $Runner
var timer = Timer.new()
var countdown = 2.0  # Temps d'attente entre les messages
@onready var music = $Music

func _ready():
	music.play()
	timer.wait_time = countdown
	timer.one_shot = true
	add_child(timer)  # Ajoutez le Timer à la scène
	timer.connect("timeout", Callable(self,"_on_Timer_timeout"))
	label.text ="[center]À vos marques[/center]"
	#show_message("À vos marques")
	timer.start()

var stage = 0  # Ajoutez une variable pour suivre l'étape de la séquence

func _on_Timer_timeout():
	if stage == 0:
		label.text ="[center]Pret[/center]"
		stage += 1
		timer.start()
	elif stage == 1:
		start_your_race_timer()

func show_message(text):
	label.text = text

func start_your_race_timer():
	runner._some_function_to_start_timer()
	label.hide()
	$ColorRect3.hide()

