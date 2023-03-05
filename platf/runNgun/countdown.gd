extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal end()

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	if $Control/count.countdown_time <= 0:
		emit_signal('end')
