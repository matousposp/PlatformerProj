extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var health = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default")
	$AnimationPlayer.play("run")
	
func _process(delta):
	if health <= 0:
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Player_hit(id):
	if id == 1:
		health -= 1
