extends Area

var speed = 0.5

func _physics_process(delta):
	if Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right"):
		translation.x += speed
	if Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left"):
		translation.x -= speed
	if Input.is_action_pressed("ui_up"):
		translation.z += speed
	if Input.is_action_pressed("ui_down"):
		translation.z -= speed/2
