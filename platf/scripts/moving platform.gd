extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play('move')

func _on_Area2D_area_entered(area):
	$AnimationPlayer.play('move')
