extends KinematicBody

onready var main = get_parent().get_node("mainship")
var fixed_trans = Vector3()

func _ready():
	fixed_trans = translation

func _process(delta):
	rotation_degrees = main.rotation_degrees
	translation = fixed_trans + main.translation
	if main.target != Vector3(0.0, 0.0, 0.0):
		$engineparticles.emitting = true
	else:
		$engineparticles.emitting = false
