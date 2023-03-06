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
var direct = 1
var charge = 0
var health = 100
var dash = 100
var coins = 0
var cooldown = 60
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _reset_jump():
	JUMPFORCE = 460
	

func _physics_process(delta):
	cooldown -= 1
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_pressed("dash") and dash > 10:
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
	
	elif Input.is_action_pressed("right"):
		
		motion.x = MAXSPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("roll")
		direct = 1
		
		
	elif Input.is_action_pressed("left"):
		motion.x = -MAXSPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("roll")
		direct = -1
		
	elif Input.is_action_just_pressed("attack"):
		var fry_direction = self.global_position.direction_to(Vector2(position.x+(50)*direct,position.y))
		fry(fry_direction)  
		
	else:
		motion.x = 0
		$AnimatedSprite.play("default")
		
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			if burger == true:
				JUMPFORCE = 1100
				burger = false
			else:
				JUMPFORCE = 460
			motion.y = -JUMPFORCE
	if health <= 0:
		get_tree().reload_current_scene()
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
	
#level 1
func _on_pear_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',1)
		
func _on_broccoli_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',2)

func _on_wotamelon_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',3)

func _on_wotamelon2_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',4)

func _on_broccoli2_area_entered(area):
	if area.is_in_group('player') or area.is_in_group('enemy'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',5)

func _on_brock_barack():
	if cooldown <= 0:
		health -= 34
		cooldown = 60

#level 2

func _on_peer_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',1)
		
func _on_broke_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',2)

func _on_broke2_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',3)

func _on_peer2_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',4)

func _on_burger_area_entered(area):
	if area.is_in_group('player'):
		burger = true

#level 3
func _on_brocoli_area_entered(area):
	print(area)
	if area.is_in_group('player'):
		print('hi')
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',1)


func _on_brocoli2_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',2)

func _on_brocoli3_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',3)

func _on_brocoli4_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',5)

func _on_melonwater_area_entered(area):
	if area.is_in_group('player'):
		print(area)
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',4)

func _on_pare_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',6)

func _on_pare2_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',7)

func _on_pare3_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',8)

func _on_lepreborder_area_entered(area):
	get_tree().reload_current_scene()


func _on_leprechaun1_area_entered(area):
	if area.is_in_group('player'):
		health -= 34
	else:
		emit_signal('hit',1)


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
	
func _on_lvl6p_area_entered(area):
	get_tree().change_scene("res://level7.tscn")
	
func _on_Weight_tatehit():
	if cooldown <= 0:
		cooldown = 60
		health -= 34

func _on_borderbeta_area_entered(area):
	get_tree().reload_current_scene() 



func _on_borderagain_area_entered(area):
	get_tree().reload_current_scene() 




func _on_PihranhaPlant_area_entered(area):
	get_tree().reload_current_scene()





func _on_AndrewTate_knockback():
	if cooldown <= 0:
		cooldown = 60
		health -= 34
	motion.x *= 5
	motion.y -= 1000


func _on_portal26_area_entered(area):
	get_tree().change_scene("res://scenes/level6.tscn")
	

	
func GetCoin():
	coins += 1
	
	
func _on_border_area_entered(area):
	if area.is_in_group('player'):
		get_tree().reload_current_scene()


func _on_Area2D_area_entered(area):
	if area.is_in_group('coin'):
		coins += 1


func _on_tatearea_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',2)
		
func _on_stationOP_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',2)

func _on_cannonball_ballin():
	if cooldown <= 0:
		cooldown = 60
		health -= 34

func _on_obstacle5_area_entered(area):
	get_tree().reload_current_scene()


func _on_pirrana_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',2)

func _on_pirrana2_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',2)


func _on_pirrana3_area_entered(area):
	if area.is_in_group('player'):
		if cooldown <= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',2)


func _on_Beam_beam():
	if cooldown <= 0:
		cooldown = 60
		health -= 34

func _on_birb_area_entered(area):
	if area.is_in_group('player'):
		health -= 18
	else:
		emit_signal('hit',2)
		
func _on_portalyesyesyes_area_entered(area):
	get_tree().change_scene("res://scenes/finallevel.tscn")

#level 7

func _on_cat_area_entered(area):
	if area.is_in_group('player'):
		if cooldown >= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',1)


func _on_brocc_area_entered(area):
	if area.is_in_group('player'):
		if cooldown >= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',2)


func _on_brocc2_area_entered(area):
	if area.is_in_group('player'):
		if cooldown >= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',3)


func _on_waterm_area_entered(area):
	if area.is_in_group('player'):
		if cooldown >= 0:
			cooldown = 60
			health -= 34
	else:
		emit_signal('hit',4)
