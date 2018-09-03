extends TextureProgress

func _process(delta):
	var bus = AudioServer.get_bus_index("Master")
	value = (AudioServer.get_bus_peak_volume_left_db(bus,0) + AudioServer.get_bus_peak_volume_right_db(bus,0)) / 2