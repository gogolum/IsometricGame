extends Control

@onready var spawn_timer : Timer = $SpawnTimer
@onready var animation_player = $PointTexture/AnimationPlayer

func _ready():
	global_position = get_global_mouse_position()
	spawn_timer.start()
	animation_player.play("fade_out")

func _on_spawn_timer_timeout():
	queue_free()
