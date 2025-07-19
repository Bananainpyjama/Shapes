extends Node2D

var dir = Vector2(1000,0)
var rot_speed = 0.2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale = Vector2(0.2,0.2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += dir * delta
	rotate(rot_speed * 2 * PI * delta)


func _on_timer_timeout() -> void:
	queue_free()

func hit_feedback(object):
	queue_free()
