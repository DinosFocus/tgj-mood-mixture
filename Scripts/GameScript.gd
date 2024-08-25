extends Node

var distance_max = 1.7

var phase_intro = true # Whether or not the intro must be done
var phase_end = false # Whether or not the end must be done

# Variables propres à une potion :
var target_color = Color.BLACK
var max_distance = 1.0
var min_quantity = .5
var score_max_grantable = 100
var target_color_visible = false

var is_close_to_target = false
var is_potion_ready = false
var distance_to_target = 100

var current_client_index = 0

var score = 0

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

func add_score() :
	# On calcule le score en fonction de la distance
	# Effet de seuil : si la distance est inférieure à 20% de la distance max, on donne le score max, sinon on donne un score proportionnel à la distance
	var distance_relative = distance_to_target/distance_max # Distance entre 0 et 1
	if distance_relative <= 0.2 :
		score += score_max_grantable
	else :
		score += score_max_grantable * (1 - distance_relative)
	score = ceil(score)
