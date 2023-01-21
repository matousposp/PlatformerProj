extends KinematicBody2D

const UP= Vector2(0, -1) 
const GRAVITY= 20
const MAXFALLSPEED= 1000
const MAXSPEED= 200
const JUMPFORCE = 400
var motion = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	
	
	if Input.is_action_pressed("right"):
		motion.x = MAXSPEED
		$Sprite.flip_h = false
		$AnimationPlayer.play("Roll")
		
	elif Input.is_action_pressed("left"):
		motion.x = -MAXSPEED
		$Sprite.flip_h = true
		$AnimationPlayer.play("Roll")
	else:
		motion.x = 0
		$AnimationPlayer.play("Idle")
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
	
	
	
	motion = move_and_slide(motion, UP)
	



