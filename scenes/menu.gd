extends Control



func _on_start_pressed():
	if Globals.lvl == 0:
		get_tree().change_scene_to(Globals.lvl1)
	else:
		pass
	hide()

func _on_options_pressed():
	pass # replace with function body

func _on_quit_pressed():
	get_tree().quit()

