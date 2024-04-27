extends RigidBody3D


var target : int
var Tpos : Vector3
func _ready():
	Tpos = get_parent_node_3d().get_child(target).position
	linear_velocity = (Tpos - position) * 2
