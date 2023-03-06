extends Area2D

export(int) var SPEED: int = 0

signal beam
var x = 0

func _ready():
	get_node("CollisionShape2D").disabled = true
	$AnimatedSprite.play("beam")
	connect('beam',get_parent().get_node('Player'),'_on_Beam_beam')

func _physics_process(delta):
	x += 1
	if x == 70:
		get_node("CollisionShape2D").disabled = false
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta
	
func destroy():
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Beam_area_entered(area):
	if area.is_in_group('player'):
		emit_signal('beam')
	destroy()

func _on_AnimatedSprite_animation_finished():
	destroy()
