extends Control

var x = 90
var oldhealth = 100
var hp = 100

func _process(delta):
	if hp != get_parent().health:
		hp -= 1
	$HealthBar.value = hp
	x -= 1
	if x <= 0 and hp >= 33:
		visible = false
	else:
		visible = true
	if oldhealth != hp:
		oldhealth = hp
		x = 90
