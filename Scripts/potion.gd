extends Node2D

var Mixbox = preload("res://addons/mixbox/mixbox.gd")

var color = Color.BLACK
var quantity = 0

var bottom_height
var max_height

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bottom_height = $Liquid.polygon[0].y
	max_height = $Liquid.polygon[2].y
	update_height()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_height():
	var height = quantity * (max_height-bottom_height) + bottom_height
	$Liquid.polygon[2].y = height
	$Liquid.polygon[3].y = height
	

func add_liquid(quant: float, col: Color) -> void:
	# On gère le dépassement total
	var real_quantity
	if quant + quantity > 1:
		real_quantity = 1 - quantity
		quantity = 1
	else:
		real_quantity = quant
		quantity += real_quantity

	var ratio = real_quantity / quantity
	color = Mixbox.lerp(color, col, ratio)
	$Liquid.color = color
	update_height()
