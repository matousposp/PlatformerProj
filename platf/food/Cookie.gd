extends KinematicBody2D

const GRAVITY = Vector2(0, 500)

var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity += GRAVITY * delta
	velocity = move_and_slide(velocity)

func _on_Area2D_area_entered(area):
	if area.is_in_group('player'):
		queue_free()
