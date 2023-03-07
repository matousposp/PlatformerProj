extends Area2D

export(int) var SPEED: int = 800

var y = -10

signal tatehit

func _ready():
	connect('tatehit',get_parent().get_node('Player'),'_on_Weight_tatehit')

func _physics_process(delta):
	y += 0.5
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta
	position.y += y
	
func destroy():
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Weight2_area_entered(area):
	if area.is_in_group('player'):
		$AudioStreamPlayer.play()
		emit_signal('tatehit')
	else:
		if area.is_in_group('tate'):
			pass
		else:
			destroy()
