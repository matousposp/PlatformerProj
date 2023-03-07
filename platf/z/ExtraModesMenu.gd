extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_run_pressed():
	get_tree().change_scene("res://runNgun/runNgun.tscn")


func _on_return1_pressed():
	get_tree().change_scene("res://scenes/main menu.tscn")



	


func _on_sumo_pressed():
	get_tree().change_scene("res://sumProj/sumo.tscn")
