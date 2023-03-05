extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_start_pressed():
	get_tree().change_scene("res://scenes/level1.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_level_select_pressed():
	get_tree().change_scene("res://other/levelsel.tscn")


