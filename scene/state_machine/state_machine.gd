extends Node

@onready var player = $".."

enum states {IDLE, WALKING, RUNNING, JUMPING, AIR}

var curr_state = states.IDLE

#movement variables
const speed = 300

#state machine methods
func change_state(new_state):
	curr_state = new_state
	
func _physics_process(delta):
	match curr_state:
		states.IDLE:
			player.idle()
		states.RUNNING:
			player.running()
