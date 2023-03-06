extends Area2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
var x = 60

func _ready():
	$AnimatedSprite.play("default")

func _process(delta):
	if x > 1:
		x -= 1
		position.x -= 2
	if x < -1:
		x += 1
		position.x += 2
	if x == 1:
		$AnimatedSprite.flip_h = false
		x = -60
	if x == -1:
		$AnimatedSprite.flip_h = true
		x += 60

func _on_Player_hit(id):
	if id == 6:
		queue_free()
