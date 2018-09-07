extends KinematicBody

var speed = 20
var rot_speed = 40
var velocity = Vector3()
var accel = 5
var direction

var begin = Vector3(0.0,0,0)
var end = Vector3(0,0,15)
var m = SpatialMaterial.new()
var target = Vector3()
onready var im = get_node("draw") #ImmediateGeometry
var lane_move = 1.0 
var move_speed = 5.0
var can_move = true

func _input(event):
	if Input.is_action_just_pressed("left") && can_move:
		$move_tween.interpolate_method(self, "move_and_slide", translation, Vector3(lane_move, 0.0, 0.0),move_speed,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
		$move_tween.start()
		can_move = false
	if Input.is_action_just_pressed("right") && can_move:
		$move_tween.interpolate_method(self, "move_and_slide", translation, Vector3(-lane_move, 0.0, 0.0),move_speed,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
		$move_tween.start()
		can_move = false
		



func _ready():
	Globals.mainship = self
	#Colors for immediategeometry
	m.flags_unshaded = true
	m.flags_use_point_size = true
	m.albedo_color = Color(1.0, 0.0, 0.0, 1.0)

func shoot():
	im.set_material_override(m)
	im.clear() # is this necessary???? or even bad
	im.begin(Mesh.PRIMITIVE_LINES)
	im.add_vertex(begin)
	im.add_vertex(end)
	im.end()

func _on_move_tween_tween_completed(object, key):
	can_move = true
	get_parent().create_lanes()
	
