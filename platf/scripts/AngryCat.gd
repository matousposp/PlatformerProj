extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gameWidth: int
var gameHeight: int
var spriteWidth: int
var spriteHeight: int

export var velocity: float = 220.0

func _enter_tree():
	pass
	#setupSprite()
	#setupGameWindow()

func _physics_process(delta):
	move(delta)
	
func move(delta):
	position.x -= delta * velocity
	$AnimatedSprite.play("default")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
