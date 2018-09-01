extends KinematicBody

var speed = 20
var rot_speed = 40
var velocity = Vector3()
var accel = 5
var direction

var begin = Vector3(0.0,0,0)
var end = Vector3(0,0,15)
var m = SpatialMaterial.new()

func _physics_process(delta):
	if (Input.is_action_pressed("left")):
		rotation_degrees = rotation_degrees + Vector3(0.0, rot_speed * delta, 0.0);
	if (Input.is_action_pressed("right")):
		rotation_degrees = rotation_degrees + Vector3(0.0, -rot_speed * delta, 0.0);
	direction = Vector3() 
	var heading = get_global_transform().basis
	if Input.is_action_pressed("up"):
		direction += heading.z
	if Input.is_action_pressed("down"):
		direction -= heading.z
	direction = direction.normalized()
	var target = direction * speed
	velocity = velocity.linear_interpolate(target,accel * delta)
	if target != Vector3(0,0,0):
		$engineparticles.emitting = true
	else:
		$engineparticles.emitting = false
	move_and_slide(velocity)
	if Input.is_action_pressed("shoot"):
		shoot()
	else:
		$draw.clear()


func _ready():
	#Colors for immediategeometry
	m.flags_unshaded = true
	m.flags_use_point_size = true
	m.albedo_color = Color(1.0, 0.0, 0.0, 1.0)


func shoot():
	var im = get_node("draw") #ImmediateGeometry
	im.set_material_override(m)
	im.clear()
	im.begin(Mesh.PRIMITIVE_LINES)
	im.add_vertex(begin)
	im.add_vertex(end)
	im.end()

