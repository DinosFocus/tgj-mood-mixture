extends Node2D

var current_color_requested = ""
var current_color_score = -1
var list_client = [
	"client_1",
	"client_2"
]


func get_current_client() -> String :
	return list_client[GameScript.current_client_index]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	launch_dialogue()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func launch_dialogue() :
	# Connect signals :
	Dialogic.VAR.variable_was_set.connect(handle_dialogic_variable_change)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	
	print("Potion ready : " + str(Dialogic.VAR.get("potion_ready")))
	
	if GameScript.phase_intro :
		Dialogic.start("intro")
	else :
		Dialogic.start(get_current_client()) # launch dialog


func _enter_tree() -> void:
	if GameScript.is_potion_ready :
		Dialogic.VAR.set_variable("potion_ready", true)
		Dialogic.VAR.set_variable("current_color_ok", GameScript.is_close_to_target)

func _on_go_to_potion_maker_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/PotionMaker.tscn")

func handle_dialogic_variable_change(info:Dictionary) -> void : # Au changement de variable par Dialogic
	if info.get("variable") =="current_color_requested" : # Only react if the current_color_requested changes
		current_color_requested = Dialogic.VAR.current_color_requested
		print("color :" + current_color_requested)
		$ColorRequestedRectangle.color = current_color_requested # Get the color_requested
		$GoToPotionMakerButton.disabled = false # Activate the button to go to the potion maker scene
		GameScript.target_color = Color(current_color_requested)
 
func _on_timeline_ended():	# A la fin d'un dialogue
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	
	#Deux cas : 
		#- soit le client est content, et on passe au suivant
		#- sinon, on relance le client en réinitialisant les variables de potion réalisé
	if GameScript.is_potion_ready or GameScript.phase_intro :	# On ne gère que le cas où la potion est déjà prête, sinon c'est potentiellement juste la fin de la demande du client
		if GameScript.is_close_to_target :	#Client content, on passe à la suite
			GameScript.current_client_index += 1
		elif GameScript.phase_intro : # The intro is over, launch the first client !
			GameScript.phase_intro = false
		# Dans tous les cas, on reset la potion, et on relance le dialogue (qui sera soit passé au client suivant, soit on revient au même client) :
		GameScript.reset_potion()
		launch_dialogue()
	
	
	
	
