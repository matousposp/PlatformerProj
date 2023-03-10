extends KinematicBody2D

const UP= Vector2(0, -1) 
var GRAVITY= 20
var MAXFALLSPEED= 1000
var MAXSPEED= 200
var JUMPFORCE = 460
var motion = Vector2()
var jumps = 0
var bullet_speed = 10



# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _reset_jump():
	JUMPFORCE = 460
	

func _physics_process(delta):
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_pressed("dash"):
		MAXSPEED = 300
	else:
		MAXSPEED = 200
	
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
	
	elif Input.is_action_pressed("right"):
		
		motion.x = MAXSPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("roll")
		
		
	elif Input.is_action_pressed("left"):
		motion.x = -MAXSPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("roll")
		
		
	elif Input.is_action_pressed("attack"):
		$AnimatedSprite.play("attack")
		
		
	else:
		motion.x = 0
		$AnimatedSprite.play("default")
		
	if is_on_floor():
		motion.y -= get_floor_velocity().y
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE

	
	
	
	motion = move_and_slide(motion, UP)


func _on_bottom_border_area_entered(area):
	get_tree().reload_current_scene() 



func _on_portal1_area_entered(area):
	get_tree().change_scene("res://scenes/level2.tscn")
	
func _on_burger_area_entered(area):
	pass


func _on_enemy1_area_entered(area):
	get_tree().reload_current_scene()






func _on_portal2_area_entered(area):
	get_tree().change_scene("res://scenes/level3.tscn")


