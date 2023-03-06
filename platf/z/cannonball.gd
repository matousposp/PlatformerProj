extends Area2D

export(int) var SPEED: int = 800

signal ballin

func _ready():
	connect('ballin',get_parent().get_node('Player'),'_on_cannonball_ballin')	

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta

func _on_cannonball_area_entered(area):
	if area.is_in_group('player'):
		emit_signal('ballin')
	else:
		if area.is_in_group('enemy'):
			pass
		else:
			queue_free()


func _on_cannonball_body_entered(body):
	queue_free()
