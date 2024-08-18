extends Node

var phase_intro = true # Whether or not the intro must be done
var phase_end = false # Whether or not the end must be done

var target_color = Color.BLACK
var max_distance = 1
var min_quantity = .5

var is_close_to_target = false
var is_potion_ready = false

var current_client_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reset_potion() :
	is_potion_ready = false
	is_close_to_target = false
	Dialogic.VAR.set_variable("potion_ready", GameScript.is_potion_ready)
	Dialogic.VAR.set_variable("current_color_ok", GameScript.is_close_to_target)
