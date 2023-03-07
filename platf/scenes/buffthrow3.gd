extends Area2D

export(PackedScene) var WEIGHT: PackedScene = preload('res://scenes/Weight.tscn')

var x = 120
var seen = false

func _ready():
	$AnimatedSprite.play("default")

func _process(delta):
	x -= 1
	if x == 0:
		x = 120
		if seen:
			var weight_direction = self.global_position.direction_to(get_parent().get_node('Player').position)
			weight(weight_direction)

func weight(weight_direction:Vector2):
	if WEIGHT:
		var weight = WEIGHT.instance()
		get_tree().current_scene.add_child(weight)
		weight.global_position = self.global_position
		
		var weight_rotation = weight_direction.angle()
		weight.rotation = weight_rotation

func _on_Player_hit(id):
	if id == 7: 
		queue_free()

func _on_VisibilityNotifier2D_screen_entered():
	seen = true

func _on_VisibilityNotifier2D_screen_exited():
	seen = false
