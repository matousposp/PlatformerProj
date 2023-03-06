extends KinematicBody2D

const GRAVITY = Vector2(0, 500)

signal shrink
signal shrink2

var velocity = Vector2.ZERO

func _ready():
	connect('shrink',get_parent().get_parent().get_node('Player'),'_on_cookie_shrink')
	connect('shrink2',get_parent().get_parent().get_node('Player2'),'_on_cookie_shrink')

func _physics_process(delta):
	velocity += GRAVITY * delta
	velocity = move_and_slide(velocity)

func _on_Area2D_area_entered(area):
	if area.is_in_group('player'):
		emit_signal('shrink')
	if area.is_in_group('player2'):
		emit_signal('shrink2')
	queue_free()
