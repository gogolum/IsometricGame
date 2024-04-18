extends Camera2D

@onready var player = $"../Player"
@onready var test_level = $"../"

#mouse detection to move screen
var screen_limits : int = 50
var screen_size : Vector2
var move_offset : int = 20

func _ready():
	
	#resets the camera's position
	global_position = player.global_position
	
	screen_size = get_viewport_rect().size
	
func _process(delta):
	position = player.position
	if Input.is_action_just_pressed("space"):
		position = player.position
	
	##move the screen if mouse close enough to the border
	#var m_pos = get_viewport().get_mouse_position()
	#
	#if m_pos.x <= screen_limits :
		#position.x -= move_offset
	#if m_pos.x >= screen_size.x - screen_limits : 
		#position.x += move_offset
	#if m_pos.y <= screen_limits :
		#position.y -= move_offset
	#if m_pos.y >= screen_size.y - screen_limits :
		#position.y += move_offset
	
	
	

