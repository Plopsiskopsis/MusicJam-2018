extends Node

var lvl = 0
var lvl1 = preload("res://scenes/level.tscn")
var camera1
var camera2
var camera3

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		if lvl == 0:
			get_tree().quit()
		else:
			menu.show()
			get_tree().paused = true

	if lvl != 0:
		if Input.is_action_just_pressed("1"):
			camera1.current = true
		if Input.is_action_just_pressed("2"):
			camera2.current = true
		if Input.is_action_just_pressed("3"):
			camera3.current = true