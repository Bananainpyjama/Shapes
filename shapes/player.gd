extends CharacterBody2D


const SPEED = 300.0
var acceleration = 4
var move = true
var projectile = preload("res://projectile.tscn")
var cooldown = false
var power =  100000

func _physics_process(delta: float) -> void:
	var x_dir := Input.get_axis("left", "right")
	#var y_dir := Input.get_axis("up", "down")
	var dir = Vector2(x_dir,0).normalized()
	
	if Input.is_action_pressed("shoot") and not cooldown:
		var shoot_dir = get_viewport().get_mouse_position() - global_position #get_viewport_rect().size/2

		var p = projectile.instantiate()
		p.dir = shoot_dir.normalized() * power
		get_tree().root.add_child(p)
		p.position = position
		cooldown = true
		$Timer.start()
		
	if move:
		velocity = (1 - delta * acceleration) * velocity + delta * acceleration * dir * SPEED
	move_and_slide()


func _on_timer_timeout() -> void:
	cooldown = false
