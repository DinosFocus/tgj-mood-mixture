extends Line2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_color(color: Color) -> void:
	default_color.r = .8 + color.r / 5
	default_color.g = .8 + color.g / 5
	default_color.b = .8 + color.b / 5


func set_alpha(alpha: float) -> void:
	default_color.a = alpha
