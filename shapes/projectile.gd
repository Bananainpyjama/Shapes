extends RigidBody2D

var dir = Vector2(10000,0)
var rot_speed = 0.2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale = Vector2(0.1,0.1)
	apply_force(dir)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	position += dir * delta
#	rotate(rot_speed * 2 * PI * delta)


func _on_timer_timeout() -> void:
	queue_free()

func hit_feedback(object):
	queue_free()
