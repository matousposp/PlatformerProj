extends KinematicBody2D

const SPEED = 100

var target_position = Vector2.ZERO

func _ready():
	$AnimatedSprite.play("default")

func _physics_process(delta):
	var player = get_parent().get_node("Player")
	if player:
		target_position = player.position
		var velocity = (target_position - position).normalized() * SPEED
		move_and_slide(velocity)
