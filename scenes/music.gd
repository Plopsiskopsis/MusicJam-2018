extends AudioStreamPlayer

func _ready():
	#AudioServer.set_bus_layout(load("res://default_bus_layout.tres"))
	get_parent().get_node("visualiser").set_music(stream)

func change_music(music):
	stream = music
	get_parent().get_node("visualiser").set_music(music)