extends RichTextLabel

var ms = 0
var s = 0
var m = 0
var timer_start = false

@onready var timer = $Timer

func _ready():
	timer.connect("timeout", Callable(self, "_process"))
	hide()  # Cachez le texte initialement():
	INLINE_ALIGNMENT_CENTER  # Assurez-vous que cette constante est la bonne dans votre version de Godot

func start_timer():
	timer.start()
	timer_start=true
	show()  # Affichez le texte lorsque le timer démarre

func stop_timer():
		timer.stop()
		timer_start = false

func _on_timer_timeout():
	# Mettez à jour le texte pour afficher le temps écoulé avec un formatage correct
	set_text("%02d:%02d:%03d" % [m, s, ms])
	pass
	
func _process(delta):
	if timer_start :
		ms += int(delta * 1000)  # Convertissez delta (secondes) en millisecondes
		if ms >= 1000:
			s += int(ms / 1000)  # Incrémente les secondes
			ms %= 1000  # Garde le reste pour les millisecondes
		if s >= 60:
			m += int(s / 60)  # Incrémente les minutes
			s %= 60  # Garde le reste pour les secondes
		_on_timer_timeout()

