extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 300
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	position.x = speed * delta
