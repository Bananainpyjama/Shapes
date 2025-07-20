extends Node2D

@export var n_points : int = 4
var poly

func get_ngon(n,radius):
	var step = (2*PI) / n
	var vec =  Vector2(radius,0)
	var points = []
	for i in range(n):
		vec = vec.rotated(step)
		points.append(vec)
	return PackedVector2Array(points)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	poly = Polygon2D.new()
	add_child(poly)
	var points = get_ngon(n_points,50)
	$CollisionPolygon2D.polygon = points
	$MyHitbox/CollisionPolygon2D.polygon = points
	#$MyHitbox.scale  *= 0.5
	poly.polygon = points
	poly.color = Color.BLACK

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
