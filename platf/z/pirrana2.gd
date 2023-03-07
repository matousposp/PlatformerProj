extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default")
	$AnimationPlayer.play("run")



func _on_Player_hit(id):
	if id == 2:
		queue_free()
