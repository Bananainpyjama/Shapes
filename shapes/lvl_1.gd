extends Node2D

func _ready():
	Dialogic.start("res://assets/timelinelvl1.dtl")#.process_mode = Node.PROCESS_MODE_ALWAYS
	Dialogic.process_mode = Node.PROCESS_MODE_ALWAYS
	Dialogic.timeline_ended.connect(func():get_tree().set('paused', false))
	#get_tree().paused = true
	#get_tree().paused = false
	#get_tree().root.process_mode = Node.PROCESS_MODE_DISABLED
	#get_tree().root.process_mode = Node.PROCESS_MODE_INHERIT
	pass

func _process(delta):
	pass
