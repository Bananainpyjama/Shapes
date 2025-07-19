extends RigidBody2D

var colors = [Color.CORNFLOWER_BLUE,Color.HOT_PINK,Color.DARK_GOLDENROD,Color.SEA_GREEN]
var rotation_speed = 0.1
var poly

func get_ngon(n,radius):
	var step = (2*PI) / n
	var vec =  Vector2(radius,0)
	var points = []
	for i in range(n):
		vec = vec.rotated(step)
		points.append(vec)
	return PackedVector2Array(points)

func take_damage(hitbox):
	var force := Vector2(global_position-hitbox.global_position).normalized()
	apply_impulse(force * hitbox.stagger)
	print("hit")

func _ready() -> void:
	var n = randi_range(3,6)
	poly = Polygon2D.new()
	add_child(poly)
	var points = get_ngon(n,50)
	print(points)
	$CollisionPolygon2D.polygon = points
	$MyHurtbox/CollisionPolygon2D.polygon = points
	poly.polygon = points
	poly.color = colors[randi_range(0,len(colors) -1)]
	#apply_force(Vector2(10000,10000))
#func _process(delta: float) -> void:
#	poly.rotate(rotation_speed * delta * 2 * PI)

#func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
#	state.linear_velocity = Vector2(100,100)

	
	
	#for i in range(3,8):
	#	var polygon_2d = Polygon2D.new()
	#	add_child(polygon_2d)
	#	var points = get_ngon(i,100)
	#	print(points)
	#	polygon_2d.polygon = points
	#	polygon_2d.color = colors[i%len(colors)]
	#	polygon_2d.position = Vector2(200 * (i-2),100) 
	
