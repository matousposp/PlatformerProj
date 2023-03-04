extends Control


func _input(event):
	if event.is_action_pressed("pause"):
		var pos_state = not get_tree().paused
		get_tree().paused = pos_state
		visible = pos_state
