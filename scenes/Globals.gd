extends Node

var lvl = 0
var lvl1 = preload("res://scenes/level.tscn")


func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		if lvl == 0:
			get_tree().quit()
		else:
			menu.show()
			get_tree().paused = true