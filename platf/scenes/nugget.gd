extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default")


func _on_Area2D_area_entered(area):
	print(area)
	if area.is_in_group('portal'):
		get_tree().change_scene("res://scenes/level8.tscn")
