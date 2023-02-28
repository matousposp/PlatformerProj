extends Area2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
var x = 70
var health = 3

func _ready():
		pass

func _process(delta):
	if x > 1:
		x -= 1
		$Sprite.rotation -= 0.1
		position.x -= 2
	if x < -1:
		x += 1
		$Sprite.rotation += 0.1
		position.x += 2
	if x == 1:
		$Sprite.flip_h = true
		$Sprite.rotation = 0
		x = -240
	if x == -1:
		$Sprite.flip_h = false
		$Sprite.rotation = 0
		x += 240
	if health <= 0:
		queue_free()

func _on_Player_hit(id):
	if id == 4:
		health -= 1
