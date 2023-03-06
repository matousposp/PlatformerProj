extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pos1
var pos2

func _ready():
	$AnimatedSprite.play("default")
# Called when the node enters the scene tree for the first time.
func _process(delta):
	pos2 = get_parent().get_node('Player').position
	pos1 = position
	if pos2.x < pos1.x:
		position.x += 2
	if pos2.x > pos1.x:
		position.x -= 2
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
