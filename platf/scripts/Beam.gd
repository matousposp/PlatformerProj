extends Area2D

export(int) var SPEED: int = 0

signal tatehit

var x = 0

func _ready():
	$AnimatedSprite.play("beam")
	connect('tatehit',get_parent().get_node('Player'),'_on_Beam_tatehit')

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta
	
func destroy():
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Beam_area_entered(area):
	print(area)
	if area == get_parent().get_node('Player/Area2D'):
		emit_signal('tatehit')
	destroy()

func _on_AnimatedSprite_animation_finished():
	destroy()
