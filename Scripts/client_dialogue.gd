extends Node2D

var current_color_request = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("timeline") # launch dialog
	Dialogic.VAR.variable_was_set.connect(handle_dialogic_variable_change)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	

func _on_go_to_potion_maker_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/PotionMaker.tscn")

func handle_dialogic_variable_change(info:Dictionary) -> void :
	current_color_request = Dialogic.VAR.current_color_request
	print("color :" + current_color_request)
	$ColorRequestedRectangle.color = current_color_request
	$GoToPotionMakerButton.disabled = false
 
