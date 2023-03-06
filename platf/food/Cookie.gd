extends KinematicBody2D

const GRAVITY = Vector2(0, 500)

var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity += GRAVITY * delta
	velocity = move_and_slide(velocity)
