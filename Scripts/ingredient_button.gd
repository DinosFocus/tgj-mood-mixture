extends Button

@export var color = Color.WHITE

var mouse_over

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Ingredient.set_color(color)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Ingredient.set_alpha(.8 if mouse_over && !disabled else .2)


func _on_mouse_entered() -> void:
	mouse_over = true


func _on_mouse_exited() -> void:
	mouse_over = false
