extends Area2D
class_name enemy

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("move")
	$AnimatedSprite.play("default")
	
func destroy():
	queue_free()






# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

