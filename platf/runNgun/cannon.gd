extends Area2D

export(PackedScene) var BALL: PackedScene = preload('res://runNgun/cannonball.tscn')
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x = 60
# Called when the node enters the scene tree for the first time.
func _process(delta):
	x -= 1
	$AnimatedSprite.play("default")
	if x == 0:
		var ball_direction = self.global_position.direction_to(Vector2(position.x-(50),position.y))
		ball(ball_direction) 
		x = 60 

func ball(ball_direction:Vector2):
	if BALL:
		var ball = BALL.instance()
		get_tree().current_scene.add_child(ball)
		ball.global_position = self.global_position
		
		var ball_rotation = ball_direction.angle()
		ball.rotation = ball_rotation
