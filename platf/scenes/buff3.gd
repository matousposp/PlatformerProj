extends Area2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
var x = 300
var health = 5

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
		$AnimatedSprite.flip_h = true
		x = -300
	if x == -1:
		$AnimatedSprite.flip_h = false
		x += 300

func _on_Player_hit(id):
	if id == 4:
		health -= 1
		if health == 0:
			queue_free()
