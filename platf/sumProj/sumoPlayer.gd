extends KinematicBody2D

export(PackedScene) var FIRE: PackedScene = preload('res://SumProj/fireball.tscn')

signal hit(id)
signal update()

const UP= Vector2(0, -1) 
var GRAVITY= 20
var MAXFALLSPEED= 1000
var MAXSPEED= 200
var JUMPFORCE = 460
var motion = Vector2()
var jump = 1
var bullet_speed = 10
var cool = 40
var burger = false
var direct = 1
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
	
	if Input.is_action_pressed("sumoDash") and dash > 10:
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
	
	elif Input.is_action_pressed("sumoR"):
		
		motion.x = MAXSPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("roll")
		direct = 1
		
		
	elif Input.is_action_pressed("sumoL"):
		motion.x = -MAXSPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("roll")
		direct = -1
		
	elif Input.is_action_just_pressed("sumoAttack") and cool <= 0:
		cool = 40
		var fry_direction = self.global_position.direction_to(Vector2(position.x+(50)*direct,position.y))
		fry(fry_direction)  
		
	else:
		motion.x = 0
		$AnimatedSprite.play("default")
	if is_on_floor() or jump > 0:
		if Input.is_action_just_pressed("sumoJump"):
			if burger == true:
				JUMPFORCE = 1100
				burger = false
			else:
				JUMPFORCE = 460
				jump -= 1 
			motion.y = -JUMPFORCE
	if is_on_floor():
		jump = 1
	
	if health <= 0:
		get_tree().reload_current_scene()
	motion.x += xvel
	motion = move_and_slide(motion, UP)

func fry(fireball_direction:Vector2):
	if FIRE:
		var fireball = FIRE.instance()
		get_tree().current_scene.add_child(fireball)
		fireball.global_position = self.global_position
		
		var fireball_rotation = fireball_direction.angle()
		fireball.rotation = fireball_rotation		


func _on_Area2D_area_entered(area):
	if motion.x == 0:
		xvel = -100*direct
	else:
		xvel *= -10
	motion.y = -500


func _on_border_area_entered(area):
	get_parent().get_node('win').get_node('win').visible = true
	get_tree().paused = true
