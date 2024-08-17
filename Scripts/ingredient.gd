extends Node2D

var color = Color.WHITE


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Liquid.color = color


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# donne une couleur à l'ingrédient
func set_color(col: Color) -> void:
	color = col
	$Liquid.color = color
	
