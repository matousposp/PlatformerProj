extends KinematicBody2D

export(PackedScene) var FRY: PackedScene = preload('res://scenes/Fry.tscn')

const UP= Vector2(0, -1) 
var GRAVITY= 10
var MAXFALLSPEED= 400
var MAXSPEED= 120
var JUMPFORCE = 460
var motion = Vector2()
var jumps = 0
var bullet_speed = 10
var burger = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _reset_jump():
	JUMPFORCE = 200
	

func _physics_process(delta):
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_pressed("dash"):
		MAXSPEED = 200
	else:
		MAXSPEED = 150
	
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
		
		
	elif Input.is_action_just_pressed("attack"):
		var fry_direction = self.global_position.direction_to(get_global_mouse_position())
		fry(fry_direction)  
		
	else:
		motion.x = 0
		$AnimatedSprite.play("default")
	if Input.is_action_just_pressed("jump"):
		if burger == true:
			JUMPFORCE = 1000
			burger = false
		else:
			JUMPFORCE = 300
		motion.y = -JUMPFORCE
	
	motion = move_and_slide(motion, UP)

func fry(fry_direction:Vector2):
	if FRY:
		var fry = FRY.instance()
		get_tree().current_scene.add_child(fry)
		fry.global_position = self.global_position
		
		var fry_rotation = fry_direction.angle()
		fry.rotation = fry_rotation
		

func _on_bottom_border_area_entered(area):
	get_tree().reload_current_scene() 



func _on_portal1_area_entered(area):
	get_tree().change_scene("res://scenes/level2.tscn")
	
func _on_burger_area_entered(area):
	burger = true



func _on_portal2_area_entered(area):
	get_tree().change_scene("res://scenes/level3.tscn")




func _on_lepreborder_area_entered(area):
	get_tree().reload_current_scene()


func _on_leprechaun1_area_entered(area):
	get_tree().reload_current_scene()


func _on_obstacle1_area_entered(area):
	get_tree().reload_current_scene()


func _on_obstacle2_area_entered(area):
	get_tree().reload_current_scene()


func _on_obstacle3_area_entered(area):
	get_tree().reload_current_scene()
	

func _on_BiggestBird_area_entered(area):
	get_tree().reload_current_scene()
func _on_BiggestBird2_area_entered(area):
	get_tree().reload_current_scene()


func _on_border2_area_entered(area):
	get_tree().reload_current_scene() # Replace with function body.
func _on_bigbird1_area_entered(area):
	get_tree().reload_current_scene()


func _on_portal1000_area_entered(area):
	get_tree().change_scene("res://scenes/level4.tscn")

func _on_portal10_area_entered(area):
	get_tree().change_scene("res://mountainlvl1.tscn")



func _on_border5_area_entered(area):
	get_tree().reload_current_scene() 


func _on_pear_area_entered(area):
	get_tree().reload_current_scene() 


func _on_lvl6p_area_entered(area):
	get_tree().change_scene("res://mountainlvl1.tscn")
