extends StaticBody3D

var dead
func _physics_process(delta):
	if dead:
		position.z = randi_range(-10,10)
		position.x = randi_range(-10,10)
		dead = !dead
