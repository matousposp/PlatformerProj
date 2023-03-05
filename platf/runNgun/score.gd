extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$score/Control/Label.text = str($Player.coins)


func _on_play_pressed():
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().change_scene("res://scenes/main menu.tscn")


func _on_pirrana2_area_entered(area):
	pass # Replace with function body.
