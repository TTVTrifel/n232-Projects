extends Area2D

@export var Target: Area2D

var teleport : bool
var player
func _ready():
	teleport = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		player = body
		teleport = true
		player.position = Vector2(0,0)

func _integrate_forces(state):
	if(teleport == true):	
		var newTransform = state.get_transform()
		newTransform.origin = player.transform
		state.set_transform(Vector2(960,540))
		teleport = false
		#state.transform.origin = Vector2(960,540)
		
		
		
