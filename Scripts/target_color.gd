extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Placeholder.modulate = Color(0, 0, 0, .8)
	$Container.modulate = Color(0, 0, 0, .8)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_color_and_visibility(color: Color, visibility: bool) -> void:
	$Placeholder.visible = !visibility
	if visibility:
		$Liquid.modulate = color
		$Container.modulate.r = color.r * 4 / 5
		$Container.modulate.g = color.g * 4 / 5
		$Container.modulate.b = color.b * 4 / 5
	else:
		$Liquid.modulate = Color(1, 1, 1, .2)
		$Container.modulate.r = 0
		$Container.modulate.g = 0
		$Container.modulate.b = 0
