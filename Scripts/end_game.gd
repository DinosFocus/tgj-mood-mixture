extends Node2D

var text_file_path = "res://Texts/credits.txt"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var text_content = get_text_file_content(text_file_path)
	
	$RichTextLabel.text += text_content
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_text_file_content(filePath):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var content = file.get_as_text()
	return content
