extends Node2D

var colors = [Color.CORNFLOWER_BLUE,Color.HOT_PINK,Color.DARK_GOLDENROD,Color.SEA_GREEN]
var rotation_speed = 0.3

func get_ngon(n,radius):
	var step = (2*PI) / n
	var vec =  Vector2(radius,0)
	var points = []
	for i in range(n):
		vec = vec.rotated(step)
		points.append(vec)
	return PackedVector2Array(points)
	
func _ready() -> void:
	var n = randi_range(3,9)
	var polygon_2d = Polygon2D.new()
	add_child(polygon_2d)
	var points = get_ngon(n,100)
	print(points)
	polygon_2d.polygon = points
	polygon_2d.color = colors[randi_range(0,len(colors))]
	
func _process(delta: float) -> void:
	rotate(rotation_speed * delta * 2 * PI)

	
	#for i in range(3,8):
	#	var polygon_2d = Polygon2D.new()
	#	add_child(polygon_2d)
	#	var points = get_ngon(i,100)
	#	print(points)
	#	polygon_2d.polygon = points
	#	polygon_2d.color = colors[i%len(colors)]
	#	polygon_2d.position = Vector2(200 * (i-2),100) 
	
