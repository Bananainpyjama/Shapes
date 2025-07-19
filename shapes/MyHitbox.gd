class_name MyHitbox
extends Area2D

@export var damage  = 10
@export var stagger = 30
@export var crit = 0
var effects = []


func get_stats():
	if owner.has_method("get_stats"):
		return owner.get_stats()
	else:
		return {"strength" : 0,
		"defense" : 0,
		"crit":0}
	 
func feedback(hit_object):
	if owner.has_method("hit_feedback"):
		owner.call_deferred("hit_feedback",hit_object)	

func _init():
	collision_layer = 2
	collision_mask = 0
