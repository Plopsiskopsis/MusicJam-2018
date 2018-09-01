extends Camera


func _ready():
	Globals.camera3 = self
	look_at(get_parent().get_node("mainship").translation, Vector3(0.0, 1.0, 0.0))

func _process(delta):
	pass
