extends Control

var meter

func _process(delta):
	meter = get_parent().dash
	$ProgressBar.value = meter
	if Input.is_action_pressed("dash") or meter < 100:
		visible = true
	else:
		visible = false
