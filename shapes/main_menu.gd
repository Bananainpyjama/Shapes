extends Node2D

var lvl_1 = preload("res://lvl_1.tscn")

func _on_start_pressed():
	get_tree().root.add_child(lvl_1.instantiate())
	queue_free()


func _on_option_pressed() -> void:
	pass # Replace with function body.


func _on_ende_pressed() -> void:
	get_tree().quit()
