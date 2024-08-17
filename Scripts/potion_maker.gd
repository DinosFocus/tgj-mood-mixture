extends Node2D

@export var target_color = Color.BLACK
@export var max_distance = .5
@export var min_quantity = .5

var fill_speed = .25

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Potion.target_color = target_color
	$Potion.max_distance = max_distance
	$Potion.min_quantity = min_quantity
	update_buttons()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for ingredient_button in [$CyanIngredientButton, $MagentaIngredientButton, $YellowIngredientButton, $BlackIngredientButton]:
		if ingredient_button.button_pressed:
			$Potion.add_liquid(delta * fill_speed, ingredient_button.color)
			update_buttons()


func update_buttons() -> void:
	$ResetFormButton.disabled = $Potion.is_empty()
	$SubmitFormButton.disabled = !$Potion.has_enough_liquid()


func _on_reset_form_button_pressed() -> void:
	$Potion.empty_liquid()
	update_buttons()


func _on_submit_form_button_pressed() -> void:
	print($Potion.is_close_to_target());
