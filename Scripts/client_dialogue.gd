extends Node2D

var current_color_requested = ""
var current_color_score = -1
var current_client = "client_1"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start(current_client) # launch dialog
	Dialogic.VAR.variable_was_set.connect(handle_dialogic_variable_change)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_go_to_potion_maker_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/PotionMaker.tscn")

func handle_dialogic_variable_change(info:Dictionary) -> void :
	if info.get("variable") =="current_color_requested" : # Only react if the current_color_requested changes
		current_color_requested = Dialogic.VAR.current_color_requested
		print("color :" + current_color_requested)
		$ColorRequestedRectangle.color = current_color_requested # Get the color_requested
		$GoToPotionMakerButton.disabled = false # Activate the button to go to the potion maker scene
 
func check_crafted_color(crafted_color:String) -> void :
#	TODO : Compute similarity between crafted_color and current_color_requested
	if current_color_requested == crafted_color :
		current_color_score = 100
	else :
		current_color_score = 0
	Dialogic.start(current_client) # launch dialog to react to the color crafter
