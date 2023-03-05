extends KinematicBody2D

const SPEED = 100

var target_position = Vector2.ZERO

var motion = Vector2(0,-1)

var player

func _ready():
	$AnimatedSprite.play("default")

func _physics_process(delta):
	player = get_parent().get_parent().get_node("Player")
	motion.x = 0
	if player.position.x < position.x:
		print('a')
		motion.x = 100
	if player.position.x > position.x:
		print('b')
		motion.x = -100
	move_and_slide(motion)
	#if player:
	#	target_position = player.position
	#	var velocity = (target_position - position).normalized() * SPEED
	#	move_and_slide(velocity)
