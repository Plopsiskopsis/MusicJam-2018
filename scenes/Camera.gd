extends Camera

func _process(delta):
	#look_at(get_parent().get_node("mainship").translation, Vector3(0.0, 1.0, 0.0))
	translation = get_parent().get_node("mainship").translation + Vector3(0.0, 20.0, -15.0)
	look_at(get_parent().get_node("mainship").translation,Vector3(0.0, 1.0,0.0))