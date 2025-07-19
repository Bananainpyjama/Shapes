extends CharacterBody2D


const SPEED = 300.0
var acceleration = 4
var move = true
var projectile = preload("res://projectile.tscn")

func _physics_process(delta: float) -> void:
	var x_dir := Input.get_axis("left", "right")
	var y_dir := Input.get_axis("up", "down")
	var dir = Vector2(x_dir,y_dir).normalized()
	
	if Input.is_action_just_pressed("shoot"):
		var shoot_dir = get_viewport().get_mouse_position() -  global_position

		var p = projectile.instantiate()
		get_tree().root.add_child(p)
		p.position = position
		p.dir = shoot_dir.normalized() * 1000
		
	if move:
		velocity = (1 - delta * acceleration) * velocity + delta * acceleration * dir * SPEED
	move_and_slide()
