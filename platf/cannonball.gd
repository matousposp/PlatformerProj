extends Area2D

export(int) var SPEED: int = 800

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta

func _on_cannonball_area_entered(area):
	if area.is_in_group('enemy'):
		pass
	else:
		queue_free()


func _on_cannonball_body_entered(body):
	queue_free()
