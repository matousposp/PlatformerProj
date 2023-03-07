extends Area2D

export(int) var SPEED: int = 400
export(PackedScene) var FRY: PackedScene = preload('res://scenes/fryexplosion.tscn')

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta
	
func destroy():
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Fry_body_entered(body):
	fry(body.position)
	destroy()

func _on_Fry_area_entered(area):
	fry(area.position)
	destroy()

func fry(pos:Vector2):
	if FRY:
		var fry = FRY.instance()
		get_tree().current_scene.add_child(fry)
		fry.global_position = pos
