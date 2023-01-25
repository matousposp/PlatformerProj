extends KinematicBody2D

const UP= Vector2(0, -1) 
var GRAVITY= 20
var MAXFALLSPEED= 1000
var MAXSPEED= 200
var JUMPFORCE = 460
var motion = Vector2()
var jumps = 0




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _reset_jump():
	JUMPFORCE = 460
	

func _physics_process(delta):
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
	
	elif Input.is_action_pressed("right"):
		motion.x = MAXSPEED
		$AnimatedSprite.flip_h = false

		
	elif Input.is_action_pressed("left"):
		motion.x = -MAXSPEED
		$AnimatedSprite.flip_h = true

		
	else:
		motion.x = 0
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE

	
	
	
	motion = move_and_slide(motion, UP)


func _on_bottom_border_area_entered(area):
	get_tree().reload_current_scene() 
