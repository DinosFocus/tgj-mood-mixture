extends Node2D

var Mixbox = preload("res://addons/mixbox/mixbox.gd")

var color = Color.BLACK
var target_color = Color.RED
var max_distance = .5
var quantity = 0
var min_quantity = .5

var bottom_height
var slope_height
var max_height

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bottom_height = $Liquid.polygon[0].y
	slope_height = $Liquid.polygon[1].y
	max_height = $Liquid.polygon[2].y
	update_height()
	$Sprite2D.modulate = Color(0, 0, 0, .8)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func update_height() -> void:
	var height = quantity * (max_height-bottom_height) + bottom_height
	$Liquid.polygon[2].y = height
	$Liquid.polygon[3].y = height
	var slope_progress = clamp((height - bottom_height) / (slope_height - bottom_height), 0, 1)
	$Liquid.polygon[2].x = $Liquid.polygon[0].x + ($Liquid.polygon[1].x - $Liquid.polygon[0].x) * slope_progress
	$Liquid.polygon[3].x = $Liquid.polygon[5].x + ($Liquid.polygon[4].x - $Liquid.polygon[5].x) * slope_progress


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
	$Sprite2D.modulate.r = color.r * quantity * 4 / 5
	$Sprite2D.modulate.g = color.g * quantity * 4 / 5
	$Sprite2D.modulate.b = color.b * quantity * 4 / 5
	update_height()


func empty_liquid() -> void:
	quantity = 0
	color = Color.BLACK
	$Liquid.color = color
	$Sprite2D.modulate.r = 0
	$Sprite2D.modulate.g = 0
	$Sprite2D.modulate.b = 0
	update_height()


func is_empty() -> bool:
	return quantity == 0


func has_enough_liquid() -> bool:
	return quantity >= min_quantity

func compute_distance() -> float :
	var distance = sqrt(pow(color.r - target_color.r, 2) + pow(color.g - target_color.g, 2) + pow(color.b - target_color.b, 2))
	return distance

func is_close_to_target() -> bool:
	var distance = compute_distance()
	print("Distance: " + str(distance))
	return distance <= max_distance
