extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	$AnimationPlayer.play('move')
