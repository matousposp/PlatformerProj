extends Control

var x = 120
var oldhealth = 60
var hp

func _process(delta):
	hp = get_parent().health
	$HealthBar.value = hp
	x -= 1
	if x <= 0 and hp >= 33:
		visible = false
	else:
		visible = true
	if oldhealth != hp:
		oldhealth = hp
		x = 90
