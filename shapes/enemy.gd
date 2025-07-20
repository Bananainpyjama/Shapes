extends RigidBody2D

var colors = [Color.CORNFLOWER_BLUE,Color.HOT_PINK,Color.DARK_GOLDENROD,Color.SEA_GREEN]
var rotation_speed = 0.1
var poly
@export var n_points : int = 4

func get_ngon(n,radius):
	var step = (2*PI) / n
	var vec =  Vector2(radius,0)
	var points = []
	for i in range(n):
		vec = vec.rotated(step)
		points.append(vec)
	return PackedVector2Array(points)

func take_damage(hitbox):
	if hitbox.owner.is_in_group("goals") and hitbox.owner.n_points == n_points:
		queue_free()
	else:
		var force := Vector2(global_position-hitbox.global_position).normalized()
		#apply_impulse(force * hitbox.stagger)
		$AudioStreamPlayer2D.play()
		print("hit")

func _ready() -> void:
	#if n_points == null:
	#	n_points = randi_range(3,6)
	poly = Polygon2D.new()
	add_child(poly)
	var points = get_ngon(n_points,50)
	print(points)
	$CollisionPolygon2D.polygon = points
	$MyHurtbox/CollisionPolygon2D.polygon = points
	$LightOccluder2D.occluder = OccluderPolygon2D.new()
	$LightOccluder2D.occluder.polygon = points
	poly.polygon = points
	poly.color = colors[randi_range(0,len(colors) -1)]
	poly.z_index = 3
	if n_points == 3:
		$PointLight2D.texture_scale *= 0.65   
