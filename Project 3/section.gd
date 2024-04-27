extends Node3D


var cur = 0
@export var section : Resource

func _process(delta):
	
	
	if Globals.Score > cur:
		#instantiate section and joint it to the cur section, then increment cur + 1
		#any time the score goes up a new section will spawn, be jointed, and then will wait for the next.
		_newSec()
		
func _newSec():
	var newSec = section.instantiate()
	add_child(newSec)
	newSec.target = cur
	#newSec.get_node("Section/PinJoint3D").set_node_a(get_child(cur).get_path())
	#newSec.get_child(2).set_node_a(get_child(cur.get_path()))
	
	newSec.position = Vector3(0,0,0)
	cur = cur + 1
