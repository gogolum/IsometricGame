extends CharacterBody2D

#select point UI
@onready var select_point : PackedScene = load("res://scene/ui/select_point.tscn")

#state machine
enum states {IDLE, RUNNING}
var curr_state = states.IDLE

#path finding
@onready var nav_agent = $NavigationAgent2D as NavigationAgent2D
var target_coords = null

#movement variables
const speed : float = 30000.0

func _process(delta):
	
	#Input handling
	if Input.is_action_just_pressed("right_click"):
		
		#spawn an instance of the select point
		var select_point_instance = select_point.instantiate()
		get_parent().add_child(select_point_instance)
		
		target_coords = get_global_mouse_position()
		makepath()
		
	if target_coords != null:
		var direction = to_local(nav_agent.get_next_path_position()).normalized()
		velocity = direction * speed * delta
		move_and_slide()
	
	#state machine
	match curr_state:
		states.IDLE:
			idle(delta)
		states.RUNNING:
			running(delta)

func makepath() -> void:
	if target_coords != null:
		nav_agent.target_position = target_coords

func _on_navigation_agent_2d_navigation_finished():
	print("finished")
	target_coords = null

#state machine methods
func change_state(new_state):
	curr_state = new_state

#state functions
func idle(delta):
	#print("Idle")
	pass
	
func running(delta):
	#print("running")
	move_and_slide()
