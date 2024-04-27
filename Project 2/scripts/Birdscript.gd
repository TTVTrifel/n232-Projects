extends RigidBody2D

var tracking = false
var startPos = Vector2()
var reset = false
var start = transform
var startTimer = false
var timer = 0


@export var stream: AudioStream


func _ready():
	transform = start
	max_contacts_reported = 3
	
func _input(evt):
	if( evt is InputEventMouseButton and evt.button_index == MOUSE_BUTTON_LEFT):
		if(startTimer == false):
			if(evt.is_pressed()):
				tracking = true
				startPos = evt.position
			else:
				tracking = false
				var kickDir = startPos - evt.position
				gravity_scale = 1
				apply_force(kickDir * 300)
				startTimer = true
			
func _process(delta):
	Next()
	if(startTimer == true):
		timer = timer + 1 * delta
	if(linear_velocity <= Vector2(10,10)):
		if(reset == false):
			if(timer > 5):
				reset = true
				print("reset")
			

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if(reset == true):
		timer = 0
		startTimer = false

func _integrate_forces(state):
	if(reset == true):
		print("oof")
		state.transform = start
		linear_velocity = Vector2(0,0)
		reset = false


func Next():
	
	await(get_tree().create_timer(2))
	if(GameManager.score == 1 and GameManager.level == 0):
		print("mama")
		get_tree().change_scene_to_file("res://scenes/game2.tscn")
		GameManager.level = 1
	if(GameManager.score == 2 and GameManager.level == 1):
		get_tree().change_scene_to_file("res://scenes/game3.tscn")
		GameManager.level = 2
	if(GameManager.score == 3 and GameManager.level == 2):
		GameManager.level = 0
		GameManager.score = 0
		
		get_tree().change_scene_to_file("res://scenes/End.tscn")












func _on_body_entered(body):
	AudioManager.play_sound(stream)
