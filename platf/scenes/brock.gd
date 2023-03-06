extends Area2D

export(int) var SPEED: int = 250

signal barack

func _ready():
	connect('barack',get_parent().get_node('Player'),'_on_brock_barack')

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta
	
func destroy():
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_brock_body_entered(body):
	destroy()

func _on_brock_area_entered(area):
	if area.is_in_group('player'):
		print('balls')
		emit_signal('barack')
	destroy()
