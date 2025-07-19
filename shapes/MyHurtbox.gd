class_name MyHurtbox
extends Area2D

func _init():
	collision_layer = 0
	collision_mask = 2

func _ready():
	#connect("area_entered")
	connect("area_entered",  _on_area_entered)

func _on_area_entered(hitbox: MyHitbox):
	if hitbox == null:
		return
	hitbox.feedback(self)
	if owner.has_method("take_damage"):
		owner.call_deferred("take_damage",hitbox)
		#owner.take_damage(hitbox)
