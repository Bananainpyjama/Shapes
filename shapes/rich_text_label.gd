extends RichTextLabel

var example_text = "WIllkommen bei Shapes!
Schieße die Shapes in die für sie vorgesehenen Löcher." 


func _ready() -> void:
	scroll_text(example_text)

func scroll_text(input_text:String)-> void:
	visible_characters = 0
	text = input_text
	
	for i in get_parsed_text():
		visible_characters += 1 
		await get_tree().create_timer(0.1).timeout
