extends RigidBody3D

func _process(delta):
	linear_velocity = (position - Globals.Ppos) * 2
