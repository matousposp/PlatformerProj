extends KinematicBody2D

export(PackedScene) var FRY: PackedScene = preload('res://scenes/Fry.tscn')

signal hit(id)
signal update()

const UP= Vector2(0, -1) 
var GRAVITY= 20
var MAXFALLSPEED= 1000
var MAXSPEED= 200
var JUMPFORCE = 460
var motion = Vector2()
var jumps = 0
var bullet_speed = 10
var burger = false
var jump = 1
var direct = 1
var cool = 40
var charge = 0
var health = 100
var dash = 100
var coins = 0
var xvel = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _reset_jump():
	JUMPFORCE = 460
	

func _physics_process(delta):
	cool -= 1
	if xvel < 0:
		xvel += 1
	if xvel > 0:
		xvel -= 1
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_pressed("sumo2Dash") and dash > 10:
		dash -= 0.8
		MAXSPEED = 300
	else:
		MAXSPEED = 200
		if dash >= 100:
			dash = 100
		else:
			dash += 0.5
	
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
	
	elif Input.is_action_pressed("sumo2R"):
		
		motion.x = MAXSPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("roll")
		direct = 1
		
		
	elif Input.is_action_pressed("sumo2L"):
		motion.x = -MAXSPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("roll")
		direct = -1
		
	elif Input.is_action_just_pressed("sumo2Attack") and cool <= 0:
		cool = 40
		var fry_direction = self.global_position.direction_to(Vector2(position.x+(50)*direct,position.y))
		fry(fry_direction)  
		
	else:
		motion.x = 0
		$AnimatedSprite.play("default")
		
	if is_on_floor() or jump > 0:
		if Input.is_action_just_pressed("sumo2Jump"):
			if burger == true:
				JUMPFORCE = 1100
				burger = false
			else:
				jump -= 1
				JUMPFORCE = 460
			motion.y = -JUMPFORCE
	if is_on_floor():
		jump=1
		
	if health <= 0:
		get_tree().reload_current_scene()
	motion.x += xvel
	motion = move_and_slide(motion, UP)

func fry(fry_direction:Vector2):
	if FRY:
		var fry = FRY.instance()
		get_tree().current_scene.add_child(fry)
		fry.global_position = self.global_position
		
		var fry_rotation = fry_direction.angle()
		fry.rotation = fry_rotation		


func _on_Area2D_area_entered(area):
	print(area.name)
	if motion.x == 0:
		xvel = -100*direct
	else:
		xvel *= -10
	motion.y = -500


func _on_border_area_entered(area):
	get_parent().get_node('win').get_node('win').visible = true
	get_tree().paused = true

func _on_cookie_shrink():
	scale.x *= 0.5
	scale.y *= 0.5
