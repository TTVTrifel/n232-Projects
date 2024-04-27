extends Node3D

@export var Enemy : Resource
var timer : float

func _ready():
	timer = 0
	
func _process(delta):
	timer = timer + delta
	if timer > 5:
		var NewEnem = Enemy.instantiate()
		timer = 0
		NewEnem.position.x = randi_range(-10,10)
		NewEnem.position.z = randi_range(-10,10)
		

