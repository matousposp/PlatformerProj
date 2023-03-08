extends Area2D

var direction = Vector2(1,0)

export(int) var SPEED: int = 400
export(PackedScene) var FRY: PackedScene = preload('res://scenes/fryexplosion.tscn')

func _physics_process(delta):
	direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta
	
func destroy():
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Fry_body_entered(body):
	fry(body.position)
	destroy()

func _on_Fry_area_entered(area):
	if area.is_in_group('player') or area.is_in_group('player2') or area.is_in_group('hitbox'):
		pass
	else:
		fry(position)
		destroy()

func fry(pos:Vector2):
	if FRY:
		var fry = FRY.instance()
		get_tree().current_scene.add_child(fry)
		fry.global_position = Vector2(self.position.x+(75*direction.x), self.position.y)
