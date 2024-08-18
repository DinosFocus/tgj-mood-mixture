extends Node2D

var current_color_requested = ""
var current_color_score = -1
var current_client = "client_1"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioPlayer.play_music_level()
	Dialogic.start(current_client) # launch dialog
	Dialogic.VAR.variable_was_set.connect(handle_dialogic_variable_change)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _enter_tree() -> void:
	if GameScript.is_potion_ready :
		Dialogic.VAR.set_variable("potion_ready", true)
		Dialogic.VAR.set_variable("current_color_ok", GameScript.is_close_to_target)

func _on_go_to_potion_maker_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/PotionMaker.tscn")

func handle_dialogic_variable_change(info:Dictionary) -> void :
	if info.get("variable") =="current_color_requested" : # Only react if the current_color_requested changes
		current_color_requested = Dialogic.VAR.current_color_requested
		print("color :" + current_color_requested)
		$ColorRequestedRectangle.color = current_color_requested # Get the color_requested
		$GoToPotionMakerButton.disabled = false # Activate the button to go to the potion maker scene
		GameScript.target_color = Color(current_color_requested)
 
