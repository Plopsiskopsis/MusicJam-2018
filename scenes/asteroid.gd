extends Area

export var speed = 1
var minz = -20

func _physics_process(delta):
	translation.z -= speed
	if translation.z < minz:
		queue_free()