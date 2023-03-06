extends Control

func _win_screen():
	if get_tree().paused == true:
		visible = true


func _on_go_back_pressed():
	get_tree().change_scene("res://scenes/main menu.tscn")
