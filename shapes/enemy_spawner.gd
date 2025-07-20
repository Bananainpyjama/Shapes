extends Node2D

var enemy_scene = preload("res://enemy.tscn")
@export var type : int = 4
@export var amount : int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(amount):
		var instance = enemy_scene.instantiate()
		instance.position = position + Vector2(i * 80, 0)
		add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
