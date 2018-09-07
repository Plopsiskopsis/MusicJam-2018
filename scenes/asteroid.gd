extends Area

export var speed = 1

func _physics_process(delta):
	translation.z -= speed