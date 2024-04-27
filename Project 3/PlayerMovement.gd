extends CharacterBody3D

@export var speed = 10
@export var joint : PinJoint3D
@onready var raycastnode = $RayCast3D
var score = Globals.Score
var check : bool
var timer : float

func _ready():
	check = false
	timer = 2
	
func _physics_process(delta):
	
	
	
	if Input.is_action_pressed("Forward"):
		self.velocity = -get_global_transform().basis.z * speed
	
		move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		#print(event.relative.x)
		self.rotation.y -= event.relative.x / 100
		
		

func _process(delta):
	Globals.Ppos = position
	timer = timer + delta
	if timer > .5:
		_Raycast()

				
func _Raycast():
	if raycastnode.is_colliding():
		var collisionTarget = raycastnode.get_collider()
		if collisionTarget.is_in_group("food"):
			Globals.Score = Globals.Score + 1
			
			collisionTarget.dead = true
			timer = 0
		if collisionTarget.is_in_group("enemy"):
			print("hey")
			get_tree().change_scene_to_file("res://Failure.tscn")
			
			
