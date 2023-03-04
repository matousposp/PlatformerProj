extends Control

var meter

func _process(delta):
	meter = get_parent().get_parent().get_parent().get_node('AndrewTate').health
	$ProgressBar.value = meter
