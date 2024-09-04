extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_color(color: Color) -> void:
	$Liquid.modulate = color
	$Container.modulate.r = .8 + color.r / 5
	$Container.modulate.g = .8 + color.g / 5
	$Container.modulate.b = .8 + color.b / 5


func set_alpha(alpha: float) -> void:
	$Container.modulate.a = alpha
