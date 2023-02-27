extends Area2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
var x = 70
var health = 3

func _ready():
	$AnimatedSprite.play("default")
	$AnimationPlayer.play("cat")

func _process(delta):
	pass

func _on_Player_hit(id):
	if id == 4:
		health -= 1
