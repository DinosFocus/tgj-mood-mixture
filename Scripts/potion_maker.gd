extends Node2D

var fill_speed = .25

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for ingredient_button in [$CyanIngredientButton, $YellowIngredientButton, $MagentaIngredientButton, $BlackIngredientButton]:
		if ingredient_button.button_pressed:
			$Potion.add_liquid(delta * fill_speed, ingredient_button.color)


func _on_terminer_potion_button_pressed() -> void:
	# Return to the ClientDialog scene
	get_tree().change_scene_to_file("res://Scenes/ClientDialogue.tscn")
