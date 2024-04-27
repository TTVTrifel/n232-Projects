extends RigidBody2D

var direction
func _ready():
	pass
	
func _process(delta):
	if Input.is_action_pressed("Right"):
		linear_velocity.x = 200
		print("hey")
	elif Input.is_action_pressed("Left"):
		
		linear_velocity.x = -200
	if Input.is_action_pressed("Jump"):
		linear_velocity.y = -100



func _on_body_entered(body):
	if body.is_in_group("points"):
		GameManager.score = GameManager.score + 1
