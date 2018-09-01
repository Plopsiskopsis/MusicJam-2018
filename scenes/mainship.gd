extends Area

var speed = 0.5
var movement = Vector3()

func _physics_process(delta):
	movement = Vector3()
	if Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right"):
		movement.x += speed
	if Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left"):
		movement.x -= speed
	if Input.is_action_pressed("ui_up"):
		movement.z += speed
	if Input.is_action_pressed("ui_down"):
		movement.z -= speed/2
	if movement != Vector3(0, 0, 0):
		$engineparticles.emitting = true
	else:
		$engineparticles.emitting = false
	translation += movement 