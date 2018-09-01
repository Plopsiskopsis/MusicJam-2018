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
		$engineparticles2.emitting = true
		$engineparticles3.emitting = true
		$engineparticles4.emitting = true
		
	else:
		$engineparticles.emitting = false
		$engineparticles2.emitting = false
		$engineparticles3.emitting = false
		$engineparticles4.emitting = false
		