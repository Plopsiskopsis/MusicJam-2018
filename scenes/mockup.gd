extends Spatial

var asteroid = preload("res://scenes/asteroid.tscn")


func _on_Timer_timeout():
	var aster = asteroid.instance()
	aster.translation = Vector3()
	aster.translation.z = 500
	aster.translation.x = rand_range($mainship.translation.x -50, $mainship.translation.x +50)
	add_child(aster)