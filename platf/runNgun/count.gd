extends Node2D

var countdown_time = 180

func _ready():
	$Label.text = format_time(countdown_time)

	$Timer.connect("timeout", self, "on_timer_timeout")
	$Timer.start()

func on_timer_timeout():
	countdown_time -= 1
	$Label.text = format_time(countdown_time)

	if countdown_time <= 0:
		$Timer.stop()
		# what happens after 0
		
		

func format_time(time):
	var minutes = floor(time / 60)
	var seconds = time % 60

	if seconds < 10:
		return str(minutes) + ":0" + str(seconds)
	else:
		return str(minutes) + ":" + str(seconds)
