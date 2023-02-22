extends Area2D

export(PackedScene) var BROCK: PackedScene = preload('res://scenes/brock.tscn')

var x = 120
var seen = false

func _ready():
	$AnimatedSprite.play("default")

func _process(delta):
	x -= 1
	if x == 0:
		x = 120
		if seen:
			var brock_direction = self.global_position.direction_to(get_global_mouse_position())
			brock(brock_direction)
		

func brock(brock_direction:Vector2):
	if BROCK:
		var brock = BROCK.instance()
		get_tree().current_scene.add_child(brock)
		brock.global_position = self.global_position
		
		var brock_rotation = brock_direction.angle()
		brock.rotation = brock_rotation

func _on_Player_hit():
	queue_free()


func _on_VisibilityNotifier2D_screen_entered():
	seen = true

func _on_VisibilityNotifier2D_screen_exited():
	seen = false
