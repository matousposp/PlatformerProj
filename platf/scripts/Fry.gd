extends Area2D

export(int) var SPEED: int = 200

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta
	
func destroy():
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
