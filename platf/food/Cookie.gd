extends KinematicBody2D

const GRAVITY = Vector2(0, 500)

signal shrink
signal shrink2

var xvel = 0

var velocity = Vector2.ZERO

func _ready():
	connect('shrink',get_parent().get_parent().get_node('Player'),'_on_cookie_shrink')
	connect('shrink2',get_parent().get_parent().get_node('Player2'),'_on_cookie_shrink')
	if abs(get_parent().get_parent().get_node('Player').position.x) > abs(get_parent().get_parent().get_node('Player2').position.x):
		if get_parent().get_parent().get_node('Player').position.x < position.x:
			xvel = -3
		if get_parent().get_parent().get_node('Player').position.x > position.x:
			xvel = 3
	else:
		if get_parent().get_parent().get_node('Player2').position.x < position.x:
			xvel = -3
		if get_parent().get_parent().get_node('Player2').position.x > position.x:
			xvel = 3

func _physics_process(delta):
	if is_on_floor():
		if xvel > 0:
			xvel -= 1
		if xvel < 0:
			xvel += 1
	position.x += xvel
	velocity += GRAVITY * delta
	velocity = move_and_slide(velocity)

func _on_Area2D_area_entered(area):
	if area.is_in_group('player'):
		emit_signal('shrink')
	if area.is_in_group('player2'):
		emit_signal('shrink2')
	queue_free()
